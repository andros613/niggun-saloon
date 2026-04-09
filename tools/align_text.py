# Align words from English and Hebrew
import fire


def zip_files_with_error_check(fp_en, fp_he):
    """
    Zip lines from two input files, checking for length mismatches.
    
    Args:
        fp_en (str): Path to the English file
        fp_he (str): Path to the Hebrew file
        
    Returns:
        list: List of tuples containing (english_line, hebrew_line)
        
    Raises:
        ValueError: If files have different numbers of lines
        FileNotFoundError: If either file doesn't exist
    """
    try:
        with open(fp_en, 'r', encoding='utf-8') as fin_en, open(fp_he, 'r', encoding='utf-8') as fin_he:
            lines_en = fin_en.readlines()
            lines_he = fin_he.readlines()
            
            # Check for length mismatch
            if len(lines_en) != len(lines_he):
                raise ValueError(
                    f"Files have different numbers of lines: "
                    f"English file has {len(lines_en)} lines, "
                    f"Hebrew file has {len(lines_he)} lines"
                )
            
            # Zip the lines together and strip whitespace
            zipped_lines = []
            for line_en, line_he in zip(lines_en, lines_he):
                zipped_lines.append((line_en.strip(), line_he.strip()))
                
            return zipped_lines
            
    except FileNotFoundError as e:
        raise FileNotFoundError(f"Could not open one of the files: {e}")

def reverse_hebrew_words(text):
    """Reverse word order for Hebrew text to display correctly in LilyPond"""
    words = text.strip().split()
    return ' '.join(reversed(words))

def escape_lilypond_text(text):
    """Escape special characters for LilyPond markup"""
    # Replace backslashes and quotes that could break LilyPond markup
    text = text.replace('\\', '\\\\')
    text = text.replace('"', '\\"')
    text = text.replace('{', '\\{')
    text = text.replace('}', '\\}')
    return text

def main(fp_en, fp_he):
    # Get zipped lines with error checking
    zipped_lines = zip_files_with_error_check(fp_en, fp_he)
    
    # Collect all English and Hebrew lines
    english_lines = []
    hebrew_lines = []
    
    for line_en, line_he in zipped_lines:
        # Process English line
        text_en = line_en.strip()
        text_en = escape_lilypond_text(text_en)
        english_lines.append(text_en)
        
        # Process Hebrew line
        text_he = line_he.strip()
        text_he = reverse_hebrew_words(text_he)
        text_he = escape_lilypond_text(text_he)
        hebrew_lines.append(text_he)
    
    # Print as two columns side by side
    print('\\markup {')
    print('  \\line {')
    print('    \\hspace #25')
    print('    \\column {')
    for line in english_lines:
        print(f'      \\line {{ {line} }}')
        print('      \\vspace #0.5')
    print('    }')
    print('    \\hspace #2')
    print('    \\column {')
    print('      \\right-align {')
    print('        \\fontsize #1.5 {')
    for line in hebrew_lines:
        print(f'          \\line {{ {line} }}')
        print('          \\vspace #0.5')
    print('        }')
    print('      }')
    print('    }')
    print('  }')
    print('}')


if __name__ == '__main__':
    fire.Fire(main)

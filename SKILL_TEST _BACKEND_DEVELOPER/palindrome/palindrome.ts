const isPalindrome = (str: string): boolean => {
    const cleanedStr = str.replace(/[^a-zA-Z0-9]/g, '').toLowerCase();
    const reversedStr = cleanedStr.split('').reverse().join('');
    return cleanedStr === reversedStr;
};

// Contoh penggunaan
const testStr1 = "Katak";
const testStr2 = "Radar";
const testStr3 = "Ibu Ratna Antar Ubi";
const testStr4 = "Kasur Rusak";

const testStr5 = "Meja";
const testStr6 = "Tower";
const testStr7 = "Ini Ibu Budi";
const testStr8 = "Pintu Rusak";

const printResult = (str: string, isPalindrome: boolean): void => {
    console.log(`"${str}" apakah palindrome: ${isPalindrome ? 'Benar' : 'Bukan'}`);
};

printResult(testStr1, isPalindrome(testStr1));
printResult(testStr2, isPalindrome(testStr2));
printResult(testStr3, isPalindrome(testStr3));
printResult(testStr4, isPalindrome(testStr4));
console.log('======================');
printResult(testStr5, isPalindrome(testStr5));
printResult(testStr6, isPalindrome(testStr6));
printResult(testStr7, isPalindrome(testStr7));
printResult(testStr8, isPalindrome(testStr8));

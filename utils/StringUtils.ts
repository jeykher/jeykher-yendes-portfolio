/* STRING UTILS @ JEYKHER PERNIA YENDES - 2022 */

/**
 * @function        isPalindrome                
 * @description     This method check if word is palindromo or not
 * @param           {str} string to check 
 * @returns         boolean
 */
 export const isPalindrome = (str: string): boolean => {
    const strReversed: string = str.split("").reverse().join("");
    return strReversed === str ? true : false;
};

/** 
 * @function        capitalizeString
 * @description     This method capitalize string
 * @param           {str} string to capitalize
 * @returns         string   
 */
 export const capitalizeString = (str: string): string => {
    let formattedString: string = str.trim().toLowerCase().replace(/\w\S*/g, (w) => (w.replace(/^\w/, (c) => c.toUpperCase())));
    return formattedString;
};

/**
 * @function		searchString
 * @description		This method check if one string contain string or character coinciden inside of this one
 * @param			{strSearch} stringToSearch string or character to search on word or string
 * @param			{str} str string to search coinciden
 * @returns			{boolean}
 */
 export const searchString = (stringToSearch: string, str: string): boolean => {
	if (str.search(stringToSearch) !== -1) {
		return true;
	}
	return false;
};

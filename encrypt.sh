echo "Hello! What would you like to do: (1) Encrypt new file (2) Decrypt existing file: "
read numchoice 

if [ $numchoice == "1"  ]; 
then 
	echo "What file would you like to encrypt: "
	read filename
	echo "What do you want to call the encrpyted file (must end in .ssl): "
	read output
	openssl genrsa -out private.pem 1024
	openssl rsa -in private.pem -out public.pem
	openssl rsautl -encrypt -inkey public.pem -in $filename -out $output
	echo "Public/Private key generated along with encrypted file!"

 elif [ $numchoice == "2" ]; 
 then
        echo "What file would you like to decrypt: "
        read dfilename
	echo "Please enter the private key: "
        read pkey
	echo "What do you want to call the decrypted file: "
	read doutput        
        openssl rsautl -decrypt -inkey $pkey -in $dfilename -out $doutput
 else
        echo "Error please enter a valid option."      

fi
#3rd option create public/private key to give to others, also move all this in to folder where all fi#les are saved/generated. Add message at end of decrption done! 



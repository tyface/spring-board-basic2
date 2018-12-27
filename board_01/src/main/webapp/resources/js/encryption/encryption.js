
//암호화
function fnRsaEnc(value, rsaPublicKeyModulus, rsaPublicKeyExponent) {

    var rsa = new RSAKey();

    rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);

     var encValue = rsa.encrypt(value);     //비밀번호를 RSA로 암호화한다.

     return encValue;

}
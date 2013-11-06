package ac.hansung.show.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Utilty {
	private static final Logger logger = LoggerFactory
			.getLogger(Utilty.class);
	
	private static String apiKey = "pzcc9OVcf2WTeR7C5lwftisBhcJK5oSs44NDXhEMVM31G4Fcl93Oy51K24FECQm8UV2E+Bi4qQX0pY2NIMJ42w==";
	

	public static String getApiKey() {
		return Utilty.enc_utf8(apiKey);
	}

	public static String enc_utf8(String str){
		try {
			return URLEncoder.encode(str, "utf-8");
		} catch (UnsupportedEncodingException e) {
			logger.error("utf-8 encoding error");
		}
		return null;
	}
}

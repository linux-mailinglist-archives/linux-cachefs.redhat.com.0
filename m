Return-Path: <linux-cachefs+bncBCXIHK4S6EJRBHPI2GWAMGQEN5CS6YA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC18222AC
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Jan 2024 21:37:50 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4279625273csf195852721cf.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 02 Jan 2024 12:37:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704227870; cv=pass;
        d=google.com; s=arc-20160816;
        b=rWZoc6Azv6tzJWUdHdjN2OvhD5Y2a9u90IMEnLXnjSmRNSCLmRNXgvDdlm0L5WG6ig
         cCkDPYmTzHRXZc8DvmRyBfHELLA1P692BSCYfCb7mavZq2muPPLRtD+RFcnE4oY/6COi
         ymK2UWPXJhxAowBtWAvfJqLN79cAE5aE58qpia+YvYO5EXfC71TlpM8SPV2rh2Q9eNoM
         WDCYoEumoejsQ+I8g3rWB2f5OpK2Ul8TZ5dghAhYGH2/RpqItkXY6sT2XZ4/Qgp0feLk
         9TrZDVkFPRpx6GEav0eMXT361iBf/ogsiiiLFja9mlLjsqijd01Oi+IHTddyBaKAUEJt
         1h5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=QBkYzd3HzRc1JGgkgSOEOB/Dn/UW424IkAT7OgZzFRg=;
        fh=d3twwIWvUzgInBVeRX0AbjlMDCtvckludHFnbJQrQ98=;
        b=CGPcj0BP8zKNMJeV/PxPB75tBbN+Xuyussj7xP1WQ7b/eP51dJw+uAwicCGTJhu4HJ
         KjTqd55+zMcT9KDg857BfXsYU5FJNqHDKTZoOzV4wt1IYxFuxkh1mFkxow2gaRk01FiE
         iQINXg4DsUx5qSel4NR6U9cR9Y4T61gapPhM+QgagCezU82olfSrDN13UyI63GTQuJxU
         bt4Ucw0PPFLLGQequqxDkMxbgqLhCuMeHyNKFQgh8/oLVidLwirkX+JDWlPMh8/E5ZM/
         rVDMP6STcx0aCB/7lHEJvhe3pJtqz+cp06Qzv6aKNFCbBnAt/gsZSNV0y0rVCBz47TSO
         8R7A==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.99 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704227870; x=1704832670;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBkYzd3HzRc1JGgkgSOEOB/Dn/UW424IkAT7OgZzFRg=;
        b=jM1fdA8uMnK8b4kS6OpjYVftecBqyg8804Z++UpvS/DE6sObswT6iZ795OrxwHUCTR
         t8G4g5NaZKImccJHaz8+Q08cV2CMs3xS4VbR34Q+7vGJhtqtgmjAwk61PVvU4kCi3zOf
         GksOpSFUFpzq/Qw+mZ5P1VpQ0OiUgiDO/iqnXcvlfBZEs3giz3gMyejS5BX6iG26IwQ2
         46kIjGrYR6xwhWqpolwXzp0F28tvJWtIt1QyofCHkSKysbJMStBYwVqzeHe+Hnakdl48
         BvmXvFNG22r+aWsIr86iFT14c+lUanZWPPy083umR4b49PIaWupP1OBxlDc02t1LYXWA
         1mwg==
X-Gm-Message-State: AOJu0YzVR8YtuW7Ueg5HLDSze+OyYFBpp2StLM2dTxkJTvbUV24RJeBG
	JzYffk1kCkSVmdk+jEZreUQTVgWfIFT7Kw==
X-Google-Smtp-Source: AGHT+IFEIi77Y8ONspljIw9/b70Rv5c9hSd/8L3beJl41BVkIQRDGVbxh4EOQuNS5EaK+njMTTZd/g==
X-Received: by 2002:ac8:5d88:0:b0:423:a31f:665a with SMTP id d8-20020ac85d88000000b00423a31f665amr32329865qtx.13.1704227869730;
        Tue, 02 Jan 2024 12:37:49 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:4459:0:b0:427:fcb3:5c4d with SMTP id m25-20020ac84459000000b00427fcb35c4dls5419466qtn.0.-pod-prod-06-us;
 Tue, 02 Jan 2024 12:37:49 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:781:2de3:9f41 with SMTP id h20-20020a05620a401400b007812de39f41mr27316229qko.38.1704227868964;
        Tue, 02 Jan 2024 12:37:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704227868; cv=none;
        d=google.com; s=arc-20160816;
        b=kl2mHBnBsBF/GO0nYvsBBXswA5KSy8G96oysuQ9w8Bh5Dlgw0c1W1h8qAGg3xOxFmx
         3xB1+fSChdlDkg6C3b+miD1pg8b5bXc1tJKn3Rg4d+fxUwmONl58IQP8a1GfAUhMZOur
         KJBjknnq0uKpEWARo1YE7g1XIH/VFjNHSSlxjRPwBJzybyI7vY9Nwuv1nng7//Ihp1MP
         BnB/Ov4D22Mc3anCrjwtE3+i0yLcmtLSvWFGAEO/c1+Nr+syoJ+rJ8gAG7fkXGJ/phsp
         aH5HHs+nYiBPg9ZMiYHq8Ps7Q63NBUmJnVE8DAa1mSuj+hzJ+t6gad4prREZ6RZ3LqQw
         8WsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=Ecs7Pd1oZ0RMqk2CqEFJ9DnjS0hihONiLG8VLGRjLJU=;
        fh=d3twwIWvUzgInBVeRX0AbjlMDCtvckludHFnbJQrQ98=;
        b=tC6/SLNSYUo5Oi4MXcMauBThzyIZLxdMBP8ZelW32QTxQSaVPrUhC9hPk6AmKasN4h
         l3bE1OU8f2P/8wNMtaRZdI7ckbu6Hf0vjIXmQbYsmneQKXU6jfi7d9Vw73jY2pLsdffG
         Dr3tuOmkD4LCX/b/qrhwKrcvWTUno//TuIvHjjgC2DIVyAuEXfwgeU3baIkpwGiLPIHb
         icZdNkmhLQWOr9UybEj0HRjK0DtCKzJq1DWs5OaZ3I6tuP2nacxA1s2ySOgZuSRjc48Z
         +4c4mLpnJ5pmuhJAv5YwDqJbQpWm6XTsX/zgeAmRc3xx/ABg/NFPh9Olc7NfUhvWbT5M
         3M7w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.99 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id i7-20020a05620a248700b0078193bdc9eesi9761774qkn.401.2024.01.02.12.37.48
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 12:37:48 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.99 as permitted sender) client-ip=115.124.30.99;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-395-mYrHSMnUOASXsVpJPdq3iA-1; Tue,
 02 Jan 2024 15:37:47 -0500
X-MC-Unique: mYrHSMnUOASXsVpJPdq3iA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71B321C32942
	for <linux-cachefs@gapps.redhat.com>; Tue,  2 Jan 2024 20:37:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 6E2BB1121313; Tue,  2 Jan 2024 20:37:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A771121312
	for <linux-cachefs@redhat.com>; Tue,  2 Jan 2024 20:37:47 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41E328489A8
	for <linux-cachefs@redhat.com>; Tue,  2 Jan 2024 20:37:47 +0000 (UTC)
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-177-Kh3Ak87qPFSeI1g7QPoKEQ-1; Tue, 02 Jan 2024 15:37:45 -0500
X-MC-Unique: Kh3Ak87qPFSeI1g7QPoKEQ-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R951e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0VzrTmRn_1704227842
Received: from 30.25.242.23(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VzrTmRn_1704227842)
          by smtp.aliyun-inc.com;
          Wed, 03 Jan 2024 04:37:25 +0800
Message-ID: <ae2502e0-af39-469b-9036-0fd9771904a8@linux.alibaba.com>
Date: Wed, 3 Jan 2024 04:37:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 33/40] netfs, cachefiles: Pass upper bound length to
 allow expansion
To: David Howells <dhowells@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 Marc Dionne <marc.dionne@auristor.com>, Paulo Alcantara <pc@manguebit.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Eric Van Hensbergen <ericvh@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
 Steve French <smfrench@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Jia Zhu <zhujia.zj@bytedance.com>, Xin Yin <yinxin.x@bytedance.com>,
 Yiqun Leng <yqleng@linux.alibaba.com>
References: <750e8251-ba30-4f53-a17b-73c79e3739ce@linux.alibaba.com>
 <20231221132400.1601991-1-dhowells@redhat.com>
 <20231221132400.1601991-34-dhowells@redhat.com>
 <198744.1704215477@warthog.procyon.org.uk>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <198744.1704215477@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 115.124.30.99 as permitted
 sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>



On 2024/1/3 01:11, David Howells wrote:
> Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
> 
>>>    	down = start - round_down(start, PAGE_SIZE);
>>>    	*_start = start - down;
>>>    	*_len = round_up(down + len, PAGE_SIZE);
>>> +	if (down < start || *_len > upper_len)
>>> +		return -ENOBUFS;
>>
>> Sorry for bothering. We just found some strange when testing
>> today-next EROFS over fscache.
>>
>> I'm not sure the meaning of
>>      if (down < start
>>
>> For example, if start is page-aligned, down == 0.
>>
>> so as long as start > 0 and page-aligned, it will return
>> -ENOBUFS.  Does it an intended behavior?
> 
> Yeah, I think that's wrong.
> 
> Does the attached help?

(+cc more people for testing)

Will test and feedback later.

Thanks,
Gao Xiang

> 
> David
> ---
> 
> diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
> index bffffedce4a9..7529b40bc95a 100644
> --- a/fs/cachefiles/io.c
> +++ b/fs/cachefiles/io.c
> @@ -522,16 +522,22 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
>   			       bool no_space_allocated_yet)
>   {
>   	struct cachefiles_cache *cache = object->volume->cache;
> -	loff_t start = *_start, pos;
> -	size_t len = *_len, down;
> +	unsigned long long start = *_start, pos;
> +	size_t len = *_len;
>   	int ret;
>   
>   	/* Round to DIO size */
> -	down = start - round_down(start, PAGE_SIZE);
> -	*_start = start - down;
> -	*_len = round_up(down + len, PAGE_SIZE);
> -	if (down < start || *_len > upper_len)
> +	start = round_down(*_start, PAGE_SIZE);
> +	if (start != *_start) {
> +		kleave(" = -ENOBUFS [down]");
> +		return -ENOBUFS;
> +	}
> +	if (*_len > upper_len) {
> +		kleave(" = -ENOBUFS [up]");
>   		return -ENOBUFS;
> +	}
> +
> +	*_len = round_up(len, PAGE_SIZE);
>   
>   	/* We need to work out whether there's sufficient disk space to perform
>   	 * the write - but we can skip that check if we have space already
> @@ -542,7 +548,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
>   
>   	pos = cachefiles_inject_read_error();
>   	if (pos == 0)
> -		pos = vfs_llseek(file, *_start, SEEK_DATA);
> +		pos = vfs_llseek(file, start, SEEK_DATA);
>   	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
>   		if (pos == -ENXIO)
>   			goto check_space; /* Unallocated tail */
> @@ -550,7 +556,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
>   					  cachefiles_trace_seek_error);
>   		return pos;
>   	}
> -	if ((u64)pos >= (u64)*_start + *_len)
> +	if (pos >= start + *_len)
>   		goto check_space; /* Unallocated region */
>   
>   	/* We have a block that's at least partially filled - if we're low on
> @@ -563,13 +569,13 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
>   
>   	pos = cachefiles_inject_read_error();
>   	if (pos == 0)
> -		pos = vfs_llseek(file, *_start, SEEK_HOLE);
> +		pos = vfs_llseek(file, start, SEEK_HOLE);
>   	if (pos < 0 && pos >= (loff_t)-MAX_ERRNO) {
>   		trace_cachefiles_io_error(object, file_inode(file), pos,
>   					  cachefiles_trace_seek_error);
>   		return pos;
>   	}
> -	if ((u64)pos >= (u64)*_start + *_len)
> +	if (pos >= start + *_len)
>   		return 0; /* Fully allocated */
>   
>   	/* Partially allocated, but insufficient space: cull. */
> @@ -577,7 +583,7 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
>   	ret = cachefiles_inject_remove_error();
>   	if (ret == 0)
>   		ret = vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
> -				    *_start, *_len);
> +				    start, *_len);
>   	if (ret < 0) {
>   		trace_cachefiles_io_error(object, file_inode(file), ret,
>   					  cachefiles_trace_fallocate_error);
> 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


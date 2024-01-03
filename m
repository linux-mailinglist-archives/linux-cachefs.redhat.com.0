Return-Path: <linux-cachefs+bncBDKYBHUEQUPBBOXH2SWAMGQEEK3UW7I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AB6822B23
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 11:15:24 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-68086d6cbfesf93820016d6.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 02:15:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704276923; cv=pass;
        d=google.com; s=arc-20160816;
        b=twyRQSdrUmFluaJ176xVCnmmCg+1q6PlBetqL4QTDSpjWR9b9lsF/4IkSPfS+xlJZV
         BPzmfJGbQsver/feWT9wshK/rbGL6bRsD3KecS9q5kPNS9r8B0D8AjDUeXdxSTcwK18F
         yFws5CDQWrF1cu26sPtCgI2yrGFbxdJDPb4iH0y065jtPbJJLG/yb3ipdJGe3D9SndcM
         ZYmA/Iw+hOQKzIWCQ8kDJOCC7Gf72AnksC6gnGogrslFZ+JHjU+4ujOspXt6U8BDq3Gr
         1QBXgWngkHuTyCaeoJPJbu/nQT1WsK9nCo+K4dw3GgPSZJ0ZMmy0hlvWbAF8TALA+qHn
         PuMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:content-transfer-encoding
         :in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:delivered-to;
        bh=S7e5oWaF9bYDU02qkoIsUCiLz/fN5vDWNcLaSYn4B8k=;
        fh=tIZT9om+erupAiq+lEdIavXdMDS/r59uB2/b6xkEPgU=;
        b=EfTc8yQJvle4Fqfj9aIF/PA0qz654uzVqnLujEiAQclsdrYY9URz2JvivFDkGb/Ivh
         9d96/3zfIvRRPNHi/SBkk7gIZnc6xaUqRwp3hFS/XOT/stQ5nznzn61lHdFBzpGXbYYR
         gKWQh/hsRSp8SNx9+cNU6UK7dgn4oawf2a/YBm9FU21iMb/SFxi7tcaR4zpQUB0BazGA
         1TKrpKrItmGNcfNIWj/0Y6LHMxAc4EAiMYh9EdMrcDFoZnlyKHRiGq4VgYu/1N3LnLJJ
         CuPpc9ameFL5x/y525TqdXhss+Nmsqf/KRlarAkgEURJR0nBG4oKWzaItyVh2sA/CQq+
         VFbQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.174 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704276923; x=1704881723;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7e5oWaF9bYDU02qkoIsUCiLz/fN5vDWNcLaSYn4B8k=;
        b=A8ofrQewmWo9XzqJ/6eaG0cy0R1OJ7Rzwm2153rYBirlVDOgpp4TYZo1rClVy3BqR+
         QgTg1KttwXQIc/Lw66At+7CAzYOY54k7jp2R48zOuNYJDxHZ/4q3qfY6YA2hUs3uewuq
         77vVrbiZVMopo100McbAqOg+VLrasX5571jnT3K8lv89k2/TU2iQM0rFP7blUoXlcVU/
         Vl+n8bqpoKR6Sh0WQZis2n/j/3PaMWMa6zPX0bPKswJ4E5SKIH6VDKjYplOBYZnfkUpz
         BWry2FcIRTRdu3scqBh3Fm99Kcy6edgjNgW/6nCW2YhwH7cO+HNgIb3yi8UTO49sPVQp
         IpRQ==
X-Gm-Message-State: AOJu0YzoFnxdST36QZLofl0M9GKHAIQXoeiIg9FyqL2Jyu0BQfgVOThc
	/Uxbee4aPKCoUkEQQ5Li7cTKt0k3JQ/2zQ==
X-Google-Smtp-Source: AGHT+IG68Qf6KZOpYKVUl+f8f8K+hbZ4aBxDUoGK2A6Uy6Drmx1Jr1BfOSxSHUYW+9iQGu9U5JhOrQ==
X-Received: by 2002:ad4:5c83:0:b0:67f:568d:2914 with SMTP id o3-20020ad45c83000000b0067f568d2914mr38104638qvh.46.1704276923137;
        Wed, 03 Jan 2024 02:15:23 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c6a:0:b0:67a:9611:38ee with SMTP id i10-20020ad45c6a000000b0067a961138eels6902627qvh.2.-pod-prod-07-us;
 Wed, 03 Jan 2024 02:15:22 -0800 (PST)
X-Received: by 2002:a05:620a:2218:b0:781:5d83:7c53 with SMTP id m24-20020a05620a221800b007815d837c53mr12275616qkh.55.1704276922474;
        Wed, 03 Jan 2024 02:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704276922; cv=none;
        d=google.com; s=arc-20160816;
        b=gsfAuwACOqmTKr3oySd1a06TOkxompdd/5ZvTL4cvYzN/YTe4WxofW3yFPeZz/aeDn
         pTQEQntko4e2ZEUveatNx5B5y1D5+DtDu4eQshXwwHtYTjucYhcgwoDR73oEhVxupJ+/
         npd0+Lkj3Z4bGsqiZgX2FIjK4M2QdgGLnisfvaMFc1BXDi4id378sPBJsB5pR/ZWUO5w
         OeO0XmNVU3Drii0nNHkHeGHbGnll5HrDnX0nsdi89FXSN4t0xcmpewK4vpIasVGtppg9
         OrMvF+AUe4zvBq67ht0RPb8JH+XUTB9cFs8kxE32vWV2oyepEWCAR9/jd+1DNX3ZUoXQ
         HzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=r9kSoFv/7+pD3aWATl3d1Zz/zNpbqJdAmBC+qKH73H4=;
        fh=tIZT9om+erupAiq+lEdIavXdMDS/r59uB2/b6xkEPgU=;
        b=JM6pOmXYBvDxNCTorI11ySxacHwa/ZlR5DElp2aS5e+xJfHbf/KK3IU962M0UHD4sU
         DQWxTTgiTg+2X1ca89Cr21X1giCbuFYzJIy6fxYO7rxvLEY4r0CRcX53pnBAeK5gJlFL
         wKaMY/c8RvLDhtfLGBbFizlVw1KMi2+KB71O5Avjjco1D7+fodV4mxwsI61ve48RUYzk
         Qo5Xie3kQOBcv60XUwwo3bEMZ2v3JIFKRFenxBfsw1j1HmD/GmtIjsx8cyULDNhzK00Z
         vVwb3ehrDiMkWrH18h4wcKpO2rk/rsXlQZ8tRoi/mFKWPnB7LrGpC2DXlu+ueCq3cH1l
         xtNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.174 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id bm16-20020a05620a199000b00781e2961370si2355609qkb.332.2024.01.03.02.15.22
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 02:15:22 -0800 (PST)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.214.174 as permitted sender) client-ip=209.85.214.174;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-CG89rfHvNc2xz_3lqibGFw-1; Wed, 03 Jan 2024 05:15:21 -0500
X-MC-Unique: CG89rfHvNc2xz_3lqibGFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E27D101A58E
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 10:15:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 1AD132026D6F; Wed,  3 Jan 2024 10:15:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1360E2026D66
	for <linux-cachefs@redhat.com>; Wed,  3 Jan 2024 10:15:20 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A563E3C02746
	for <linux-cachefs@redhat.com>; Wed,  3 Jan 2024 10:15:20 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-5rzKjK2aNGygM1Hs5y5KOQ-1; Wed, 03 Jan 2024 05:15:18 -0500
X-MC-Unique: 5rzKjK2aNGygM1Hs5y5KOQ-1
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d3f29fea66so41504345ad.3
        for <linux-cachefs@redhat.com>; Wed, 03 Jan 2024 02:15:18 -0800 (PST)
X-Received: by 2002:a17:903:11c3:b0:1d4:75c6:9560 with SMTP id q3-20020a17090311c300b001d475c69560mr6941145plh.59.1704276917712;
        Wed, 03 Jan 2024 02:15:17 -0800 (PST)
Received: from [10.3.158.72] ([61.213.176.6])
        by smtp.gmail.com with ESMTPSA id bh10-20020a170902a98a00b001d4160c4f97sm21615997plb.188.2024.01.03.02.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 02:15:17 -0800 (PST)
Message-ID: <42dd77c4-8842-4f96-958a-0d9407362b9d@bytedance.com>
Date: Wed, 3 Jan 2024 18:15:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v5 33/40] netfs, cachefiles: Pass upper bound length
 to allow expansion
To: David Howells <dhowells@redhat.com>,
 Gao Xiang <hsiangkao@linux.alibaba.com>
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
 Steve French <smfrench@gmail.com>
References: <750e8251-ba30-4f53-a17b-73c79e3739ce@linux.alibaba.com>
 <20231221132400.1601991-1-dhowells@redhat.com>
 <20231221132400.1601991-34-dhowells@redhat.com>
 <198744.1704215477@warthog.procyon.org.uk>
From: "'Jia Zhu' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
In-Reply-To: <198744.1704215477@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: zhujia.zj@bytedance.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of zhujia.zj@bytedance.com designates 209.85.214.174 as permitted
 sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Original-From: Jia Zhu <zhujia.zj@bytedance.com>
Reply-To: Jia Zhu <zhujia.zj@bytedance.com>
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



=E5=9C=A8 2024/1/3 01:11, David Howells =E5=86=99=E9=81=93:
> Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
>=20
>>>    	down =3D start - round_down(start, PAGE_SIZE);
>>>    	*_start =3D start - down;
>>>    	*_len =3D round_up(down + len, PAGE_SIZE);
>>> +	if (down < start || *_len > upper_len)
>>> +		return -ENOBUFS;
>>
>> Sorry for bothering. We just found some strange when testing
>> today-next EROFS over fscache.
>>
>> I'm not sure the meaning of
>>      if (down < start
>>
>> For example, if start is page-aligned, down =3D=3D 0.
>>
>> so as long as start > 0 and page-aligned, it will return
>> -ENOBUFS.  Does it an intended behavior?
>=20
> Yeah, I think that's wrong.
>=20
> Does the attached help?
>=20
> David
> ---

Tested-by: Jia Zhu <zhujia.zj@bytedance.com>

>=20
> diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
> index bffffedce4a9..7529b40bc95a 100644
> --- a/fs/cachefiles/io.c
> +++ b/fs/cachefiles/io.c
> @@ -522,16 +522,22 @@ int __cachefiles_prepare_write(struct cachefiles_ob=
ject *object,
>   			       bool no_space_allocated_yet)
>   {
>   	struct cachefiles_cache *cache =3D object->volume->cache;
> -	loff_t start =3D *_start, pos;
> -	size_t len =3D *_len, down;
> +	unsigned long long start =3D *_start, pos;
> +	size_t len =3D *_len;
>   	int ret;
>  =20
>   	/* Round to DIO size */
> -	down =3D start - round_down(start, PAGE_SIZE);
> -	*_start =3D start - down;
> -	*_len =3D round_up(down + len, PAGE_SIZE);
> -	if (down < start || *_len > upper_len)
> +	start =3D round_down(*_start, PAGE_SIZE);
> +	if (start !=3D *_start) {
> +		kleave(" =3D -ENOBUFS [down]");
> +		return -ENOBUFS;
> +	}
> +	if (*_len > upper_len) {
> +		kleave(" =3D -ENOBUFS [up]");
>   		return -ENOBUFS;
> +	}
> +
> +	*_len =3D round_up(len, PAGE_SIZE);
>  =20
>   	/* We need to work out whether there's sufficient disk space to perfor=
m
>   	 * the write - but we can skip that check if we have space already
> @@ -542,7 +548,7 @@ int __cachefiles_prepare_write(struct cachefiles_obje=
ct *object,
>  =20
>   	pos =3D cachefiles_inject_read_error();
>   	if (pos =3D=3D 0)
> -		pos =3D vfs_llseek(file, *_start, SEEK_DATA);
> +		pos =3D vfs_llseek(file, start, SEEK_DATA);
>   	if (pos < 0 && pos >=3D (loff_t)-MAX_ERRNO) {
>   		if (pos =3D=3D -ENXIO)
>   			goto check_space; /* Unallocated tail */
> @@ -550,7 +556,7 @@ int __cachefiles_prepare_write(struct cachefiles_obje=
ct *object,
>   					  cachefiles_trace_seek_error);
>   		return pos;
>   	}
> -	if ((u64)pos >=3D (u64)*_start + *_len)
> +	if (pos >=3D start + *_len)
>   		goto check_space; /* Unallocated region */
>  =20
>   	/* We have a block that's at least partially filled - if we're low on
> @@ -563,13 +569,13 @@ int __cachefiles_prepare_write(struct cachefiles_ob=
ject *object,
>  =20
>   	pos =3D cachefiles_inject_read_error();
>   	if (pos =3D=3D 0)
> -		pos =3D vfs_llseek(file, *_start, SEEK_HOLE);
> +		pos =3D vfs_llseek(file, start, SEEK_HOLE);
>   	if (pos < 0 && pos >=3D (loff_t)-MAX_ERRNO) {
>   		trace_cachefiles_io_error(object, file_inode(file), pos,
>   					  cachefiles_trace_seek_error);
>   		return pos;
>   	}
> -	if ((u64)pos >=3D (u64)*_start + *_len)
> +	if (pos >=3D start + *_len)
>   		return 0; /* Fully allocated */
>  =20
>   	/* Partially allocated, but insufficient space: cull. */
> @@ -577,7 +583,7 @@ int __cachefiles_prepare_write(struct cachefiles_obje=
ct *object,
>   	ret =3D cachefiles_inject_remove_error();
>   	if (ret =3D=3D 0)
>   		ret =3D vfs_fallocate(file, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZ=
E,
> -				    *_start, *_len);
> +				    start, *_len);
>   	if (ret < 0) {
>   		trace_cachefiles_io_error(object, file_inode(file), ret,
>   					  cachefiles_trace_fallocate_error);
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-cachefs+unsubscribe@redhat.com.


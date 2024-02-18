Return-Path: <linux-cachefs+bncBDW27WM2ZQPRBAHPYWXAMGQEAOCFPZI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B8D859458
	for <lists+linux-cachefs@lfdr.de>; Sun, 18 Feb 2024 04:20:33 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-68c53f2816dsf27413496d6.0
        for <lists+linux-cachefs@lfdr.de>; Sat, 17 Feb 2024 19:20:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708226432; cv=pass;
        d=google.com; s=arc-20160816;
        b=Q1eBJS1mc/DxSI7Zb0Yl+Ap9r7k9D4J3NKfhp9cB3I4yCFTeB3wxm6qiAQBa65H3G5
         LGgwFQeAUCzpXHGKVD5fF7axudqdVUYQLiUVTw9xaut/g2u0jePKdYEmvPhCL8D/klYX
         HPLmdueut34Oc2I+js5G0JaMBYrVcbeA/aDU9KNIprJN3uUCOcecEnvddnf2hVrjG6vq
         AnnqnuW909mN5ji8cALZj/CMBFdP+CCdMdjnqvmn8SsLmgPaoNcC7J/U8QBxSSV68e2b
         2ux1aybEZ6NWBRWafKLecOz+NRt9LhFRnOwjskRgRirxeXCJ5IO4yfJJuY1+/SCeRzaB
         JKeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :delivered-to;
        bh=T56PSJ7+6nZD6KD2q06Y867xY0v9mNs8Jl1yaRkwhd8=;
        fh=d67NwWeFSHMkmXhNsri7zp6C2+rcJFUiuOs5rpsiNkM=;
        b=LloiHzqdyWomaN8PynQGT14za4/GxhzRVuaCX1C0B2eh744da3etr7SZRtaPo0c9Ou
         RRXkMBd5uXnkyApJDG1Lm7lF3H7XkbTbx9U0jjs7kCro0ymaXXVUqmpCgcbZqAqhwuhn
         zXiH9NQrlfuMVsFAUE5WG500SrZ7CulDU8pMuog6vqi7I9TS1tK4oUT0KFMqbA+mrbrW
         cyrdLqkstJKbgdAMPoTomgRSwclNpjRpg1JOHnOu5j31e9T2hltuFXz0K/DUTEaVl7eJ
         RuHUVLx2wFBgaBH0oPFhM067MGuDoE/ZD1d0hbVDBnKp9pz95+kPiPr3YmrtvJeHj6FF
         Lv9A==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of jefflexu@linux.alibaba.com designates 47.90.199.16 as permitted sender) smtp.mailfrom=jefflexu@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708226432; x=1708831232;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T56PSJ7+6nZD6KD2q06Y867xY0v9mNs8Jl1yaRkwhd8=;
        b=Jf002slh81mU0HjOsYBXXS4Bh+qCwpKkWpSBkv1x3w2dCppXF40H3noqzpZ9oDBTf2
         6hDHQ4Ab2TOMO8F2Mu8PTnAaXJm6D0Dxdv0DEdeVjXontIcO0PrMd+sOU8OEamful966
         7R8IaR+SDy8dNrjxS8RzT9x7QdcUBAuBr2JeGFDZ1SDcTqqDHFq6EOEVtqSnqhVPn6U/
         GsaLyuEbRLQ24toLcSiLzpeb9QoCiuAI4PtC07Ye7xjWdXgwcWA8U9utVb/yNq7yY4ic
         JZ6cwghQ2e7hCkh0p80fSwXMuUY/PL/l5C8QTC5kTOA096PkoWxCQVEeRYKh81RThwuv
         MMHw==
X-Forwarded-Encrypted: i=2; AJvYcCVqK6+HraTzZtUDjCynRFXrBXggASpHlh+YZzbf8f8xgUJvTefg/ZXxfvLkpx9q+oRQAh66G7WCvCulxPHK+rExW/tiGzmSSFPA6nA=
X-Gm-Message-State: AOJu0Yy8CPOYHoUXwBsDdJ5BX0IygwJLu/y6MgjPYqDAs7QJoqxaZfo4
	AUMQjoE1snn5c8uBgHRemAah/ayHJfExU/rqL5Ji5lyl2TfqIyaFOb3Ie9qgHJ0=
X-Google-Smtp-Source: AGHT+IGlm6F284F4/n+jbPSMni8sFebWOQ/YqhVpY+kIcSp/Gk58jFBBASos9UOcYymbCaIIRoP0sQ==
X-Received: by 2002:a05:6214:1d07:b0:68f:2c76:38dc with SMTP id e7-20020a0562141d0700b0068f2c7638dcmr14050862qvd.57.1708226432301;
        Sat, 17 Feb 2024 19:20:32 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5b8b:0:b0:68c:a87d:febd with SMTP id 11-20020ad45b8b000000b0068ca87dfebdls2722338qvp.1.-pod-prod-04-us;
 Sat, 17 Feb 2024 19:20:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXHs3eTy4lEpvFvw9lK4suYBECaNbI1jKqN8i3eumM7muIaltgLga5GLwX7ZDF1WOyWk8dqYP0yGMsZGT2Var0nGzp7p8JfpvTDtVsIKsg=
X-Received: by 2002:a05:6214:d81:b0:68f:385d:1f9e with SMTP id e1-20020a0562140d8100b0068f385d1f9emr5925563qve.0.1708226431780;
        Sat, 17 Feb 2024 19:20:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708226431; cv=none;
        d=google.com; s=arc-20160816;
        b=xQMHuIaYeJayiEcYb85bfe6E41tWScHJDJ1+WfCNvd1Fl3kH6iUdNP9hyndcFJ7wRJ
         7zIXBlMAbLxUaieDsQja96jntXlO2UXA96FJ1lX8IgcS5pmOfFnV2LoTWyad+gxjk9n2
         x4/E6Cyu5n2hZ9i6v8c42cOYtzXmUx/UdZPZhjT5EiT0iqAuUF3CZAVS+I58DhWAodDa
         a92cIC693TsmS+jGEbHN02fqJTIiy+WnM6cAPV8jYLq5ukcNXfBTgs3dFs0lVjNbhOol
         YDzNyUju8G+J5rDZdsYdgSBJwIp6jnJ/qtgv8uI8AIBR3rT+qtgQLb8wtLSYt56qXIls
         za6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :delivered-to;
        bh=cqOsry37fOCW6Y3ou1nZ7EHlwm2eSJbNTtcAmfAvy8w=;
        fh=M82A+B4hIx6gs2YmI+0MZEMti+dfkgV0yMS1KA7vzG0=;
        b=K54TK2bkPVqUv3MnBKNRq8kT4o5nUsH9cA+157BjVifyEQCZbHPXYdye5vy45MO2gj
         iBRCdo+XcQ/8NphHxJnNx76ZHkKe8U11aElr4PRF6MBU8kAzrVpodCpgcIWRyNI52aFg
         P6tAZtsrQHm0W4MV/tgpPOYRJSEoJR0uYa5WFsXlMSODj2eIawSWDWfip6TmEFKVvLH3
         4Zb9mfkd1x0MWnCpP1GoOXi2xJrV59mNKWaO7Qz8rPhHyqcgdtrAqLW6SXm7wJRp/UHt
         ihK+voVhPyt68U2BTkAf1UsFib/uOmIAR/8bCG7AHHW4WX7Ql1eoE6UXAiPs2IAnE9PL
         GQTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jefflexu@linux.alibaba.com designates 47.90.199.16 as permitted sender) smtp.mailfrom=jefflexu@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id fq4-20020a056214258400b0068cb5e946bfsi3349554qvb.307.2024.02.17.19.20.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 19:20:31 -0800 (PST)
Received-SPF: pass (google.com: domain of jefflexu@linux.alibaba.com designates 47.90.199.16 as permitted sender) client-ip=47.90.199.16;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-DmcmYsl1MY-5qTr5XSaR-w-1; Sat, 17 Feb 2024 22:20:30 -0500
X-MC-Unique: DmcmYsl1MY-5qTr5XSaR-w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D9DA811E79
	for <linux-cachefs@gapps.redhat.com>; Sun, 18 Feb 2024 03:20:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 1A4552026D0A; Sun, 18 Feb 2024 03:20:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3C9B2026D06
	for <linux-cachefs@redhat.com>; Sun, 18 Feb 2024 03:20:29 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8135A10201E8
	for <linux-cachefs@redhat.com>; Sun, 18 Feb 2024 03:20:29 +0000 (UTC)
Received: from out199-16.us.a.mail.aliyun.com
 (out199-16.us.a.mail.aliyun.com [47.90.199.16]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-T6JHfUsgOFyCCGC01jFyGw-1; Sat, 17 Feb 2024 22:20:27 -0500
X-MC-Unique: T6JHfUsgOFyCCGC01jFyGw-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0W0kSJnS_1708226113
Received: from 30.221.145.138(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0W0kSJnS_1708226113)
          by smtp.aliyun-inc.com;
          Sun, 18 Feb 2024 11:15:13 +0800
Message-ID: <cee45d07-b885-4b4b-b9b5-d7aeedc2b2e7@linux.alibaba.com>
Date: Sun, 18 Feb 2024 11:15:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] cachefiles: fix memory leak in
 cachefiles_add_cache()
To: Baokun Li <libaokun1@huawei.com>, netfs@lists.linux.dev
Cc: dhowells@redhat.com, jlayton@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240217081431.796809-1-libaokun1@huawei.com>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <20240217081431.796809-1-libaokun1@huawei.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: jefflexu@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of jefflexu@linux.alibaba.com designates 47.90.199.16 as permitted
 sender) smtp.mailfrom=jefflexu@linux.alibaba.com
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



On 2/17/24 4:14 PM, Baokun Li wrote:
> The following memory leak was reported after unbinding /dev/cachefiles:
> 
> ==================================================================
> unreferenced object 0xffff9b674176e3c0 (size 192):
>   comm "cachefilesd2", pid 680, jiffies 4294881224
>   hex dump (first 32 bytes):
>     01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc ea38a44b):
>     [<ffffffff8eb8a1a5>] kmem_cache_alloc+0x2d5/0x370
>     [<ffffffff8e917f86>] prepare_creds+0x26/0x2e0
>     [<ffffffffc002eeef>] cachefiles_determine_cache_security+0x1f/0x120
>     [<ffffffffc00243ec>] cachefiles_add_cache+0x13c/0x3a0
>     [<ffffffffc0025216>] cachefiles_daemon_write+0x146/0x1c0
>     [<ffffffff8ebc4a3b>] vfs_write+0xcb/0x520
>     [<ffffffff8ebc5069>] ksys_write+0x69/0xf0
>     [<ffffffff8f6d4662>] do_syscall_64+0x72/0x140
>     [<ffffffff8f8000aa>] entry_SYSCALL_64_after_hwframe+0x6e/0x76
> ==================================================================
> 
> Put the reference count of cache_cred in cachefiles_daemon_unbind() to
> fix the problem. And also put cache_cred in cachefiles_add_cache() error
> branch to avoid memory leaks.
> 
> Fixes: 9ae326a69004 ("CacheFiles: A cache that backs onto a mounted filesystem")
> CC: stable@vger.kernel.org
> Signed-off-by: Baokun Li <libaokun1@huawei.com>

LGTM.

Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>


> ---
>  fs/cachefiles/cache.c  | 2 ++
>  fs/cachefiles/daemon.c | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/fs/cachefiles/cache.c b/fs/cachefiles/cache.c
> index 7077f72e6f47..f449f7340aad 100644
> --- a/fs/cachefiles/cache.c
> +++ b/fs/cachefiles/cache.c
> @@ -168,6 +168,8 @@ int cachefiles_add_cache(struct cachefiles_cache *cache)
>  	dput(root);
>  error_open_root:
>  	cachefiles_end_secure(cache, saved_cred);
> +	put_cred(cache->cache_cred);
> +	cache->cache_cred = NULL;
>  error_getsec:
>  	fscache_relinquish_cache(cache_cookie);
>  	cache->cache = NULL;
> diff --git a/fs/cachefiles/daemon.c b/fs/cachefiles/daemon.c
> index 3f24905f4066..6465e2574230 100644
> --- a/fs/cachefiles/daemon.c
> +++ b/fs/cachefiles/daemon.c
> @@ -816,6 +816,7 @@ static void cachefiles_daemon_unbind(struct cachefiles_cache *cache)
>  	cachefiles_put_directory(cache->graveyard);
>  	cachefiles_put_directory(cache->store);
>  	mntput(cache->mnt);
> +	put_cred(cache->cache_cred);
>  
>  	kfree(cache->rootdirname);
>  	kfree(cache->secctx);

-- 
Thanks,
Jingbo

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


Return-Path: <linux-cachefs+bncBDKYBHUEQUPBBMEQ7KWAMGQE2T4PPLY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AFF829A22
	for <lists+linux-cachefs@lfdr.de>; Wed, 10 Jan 2024 13:06:09 +0100 (CET)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5f7942a16c3sf51944407b3.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 10 Jan 2024 04:06:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704888368; cv=pass;
        d=google.com; s=arc-20160816;
        b=D5/x1CH/yGMYqr/yCxInxd52uD1iBUR5nPTtX63bJx3bzlS6gsuWr2GMNxxRlaeiXr
         oxB2X6+xiwtRCjF7YpifW7tUBVRer24yLpRMjgbZuLTYAQOmLGF0lmF3zAQVSc9BDXUK
         BL0Q3T9e/fmQuqsMOI4lfOG4LnAZPKy9FeySw3V6yePcYGzH21rUJHDP22ivREXmWcZo
         FtBST5kYAwaIO5fdfAh8bBu1C2MCSUZmYemxSNG9tX+ijz4EnAN/VVnJ9lYK1tZe3ZIq
         buaRstOLFAfMNK6OadWFUvTstkHFmMmhYXVnJIZPERF6xAqHF4uAhC4ZzH9t18u5g+R1
         XATw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:reply-to:content-transfer-encoding
         :in-reply-to:from:references:cc:to:subject:user-agent:mime-version
         :date:message-id:delivered-to;
        bh=lER1aWROPKbtJ73uR/67LQVZMIB/uxNrY+ZcbqwBEuY=;
        fh=JnlVeDXKAtk0NOdBBrSMZwYciOOmCeYfB3kTcn7SgXE=;
        b=q+gbiJ/FuFa991J42t48iugRCr/tHTYEtwcZwUir3hl3uexJ/blTxoewENlWinizwu
         EOTodNX3GpiuEQlE9nY+dX/1vwZZaEuWpagD80TcXImstVZe5Z962T8ojT03Q6aVngo4
         C1U3XyvlrS7FVfe135NsYhuOp1esDOJjZ3DWDvSotCQ7gaCsL5UnRnv4kB4qb5KmLyug
         5VCsSH4yYoGMBofRZC37HSbHAx/WtJJaLD4Pmdq8FjqV/hoRLLHDn5LjdABwNESaW3z4
         I/UnM/I3zcIeh7t+OGQZPmf30h9pgi7IrbfyQVzH2yqHfVtPZxQAmufz6M6uTEK7VZRW
         yShg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.210.181 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704888368; x=1705493168;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lER1aWROPKbtJ73uR/67LQVZMIB/uxNrY+ZcbqwBEuY=;
        b=Sj8RiBX6DayBNpz8XL9wjMc5Bj21Q+Q9YfQkGoASyCp6IYSxumej/lSWrJ1kQCX4Kl
         ePnof8RQpTaKiP6lllI93sMja5VDqvFwp/7u9rKRJ8rYe6taov55mvsSH7pe6rl0XJT9
         TgG8VPcPNhjaIwNVD7g/0IURN/Eem9Vf7960I7eKc1N/1o/H1aSf+ibt3F3T7t+/x213
         jvHL9h7jsyp4v3vY8h4jTHDumKNxfbXCi5lJUJ+YQuyik1PJ1BdKJZN4skY4ETpbY/Lf
         iS7gEGgjDp1GXsEjylzTwq9imef3Ki405vQo0xu3bbITq3cty6L3es85+ZuRzyEmoxEu
         uy3A==
X-Gm-Message-State: AOJu0YyJPoKOmlyA5A7T0r9uNTAvNb141h6vGEj8pGKFcOlpmx6q6fLb
	S9WM8cZpmGxgWrRV5m8WA6TFN2h+N+Ko4Q==
X-Google-Smtp-Source: AGHT+IFKzxqE4kOuRt5ixJ80eWFob1cWKen6fuBFBNR83ssiHQx6eHhpNFRIfkzOyXiAi6tHhwzqaw==
X-Received: by 2002:a25:ae0d:0:b0:dbf:1795:3ec1 with SMTP id a13-20020a25ae0d000000b00dbf17953ec1mr664135ybj.72.1704888368401;
        Wed, 10 Jan 2024 04:06:08 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:b848:0:b0:dbe:ac1f:ac3f with SMTP id b8-20020a25b848000000b00dbeac1fac3fls2562844ybm.0.-pod-prod-04-us;
 Wed, 10 Jan 2024 04:06:07 -0800 (PST)
X-Received: by 2002:a25:9109:0:b0:dbe:d41f:e957 with SMTP id v9-20020a259109000000b00dbed41fe957mr676310ybl.76.1704888367678;
        Wed, 10 Jan 2024 04:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704888367; cv=none;
        d=google.com; s=arc-20160816;
        b=bhvDrWvepwoj5WvBJLFZR67AbxiohjkGANTRwKc16dw3wkwHACQn5YDi5OjFymDwkP
         oqGMqsw7/hhjdMcaTE9CtRMiwXATuPuaXgRc2GTvs/qIf3UUGDHuh1PB7BJumtsBoapc
         zdj9p6B0TsyiLl+u8KGLG6f5JCChlo+LJ2npOnIh/AQCPp2RMX+vRZ6pRqvF0a9Uu0Mg
         QXWMsmJTneYTEu4sk/8DrMx8fuK9tzoGVek4YoynkTpK/DgcZ25fZHI28lpjYIFaL2K8
         PTzxnIMeBKGpNztOECM5Zr9ZNupbVtg/WTg6uimhX+gzTW/nw+ysq9mZwL0ltpAXop3I
         e96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=l8cKztzv2ZktLOe0dzMuixqOyjC0S8dozIynxhbNLCA=;
        fh=JnlVeDXKAtk0NOdBBrSMZwYciOOmCeYfB3kTcn7SgXE=;
        b=uSJUl43QgY9xfObrXvAojKiwc2r+bcWBAJzVEV8gdr/S0IL8dn8+4uNz/TrFNBlrOF
         UatMuGMGQWeMqtT3diWUGZqIo5iG8RpzyCbnxFiVU34X/Ck9xfXctKlMwBP9gef8b0Jk
         OcicXTVLTrU3Z6kvtb6xcjqupISIggd9CqhguO5B02zVEItfjf2O3h9qpPKFuhLjzuT+
         vDWYgq+RFNfRmIsDQQhyc4KjvS+JfmmxQEyor+ZUTeWL5XgL1F0kyVlSch+F4eRdHY9g
         co0TgqpBd6PrzEh1oz8XlSVf2giNVf3Ga4+GlwxPy8P+ATRN0E4M1scO19DQk1lyB4dr
         iWzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.210.181 as permitted sender) smtp.mailfrom=zhujia.zj@bytedance.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id g37-20020a25a4a8000000b00dbdb571ec99si1927008ybi.424.2024.01.10.04.06.07
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 04:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of zhujia.zj@bytedance.com designates 209.85.210.181 as permitted sender) client-ip=209.85.210.181;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-JCyqCtSpMqGTtSF44U62CA-1; Wed, 10 Jan 2024 07:06:06 -0500
X-MC-Unique: JCyqCtSpMqGTtSF44U62CA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E7F8185A784
	for <linux-cachefs@gapps.redhat.com>; Wed, 10 Jan 2024 12:06:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 1B8262026D6F; Wed, 10 Jan 2024 12:06:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13A072026D66
	for <linux-cachefs@redhat.com>; Wed, 10 Jan 2024 12:06:06 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E63CB185A784
	for <linux-cachefs@redhat.com>; Wed, 10 Jan 2024 12:06:05 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-LO5HtdPcNKmM2x51wBChIw-1; Wed, 10 Jan 2024 07:06:04 -0500
X-MC-Unique: LO5HtdPcNKmM2x51wBChIw-1
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6d9a79a1ad4so1972366b3a.2
        for <linux-cachefs@redhat.com>; Wed, 10 Jan 2024 04:06:03 -0800 (PST)
X-Received: by 2002:a05:6a00:3204:b0:6da:63a5:3f32 with SMTP id bm4-20020a056a00320400b006da63a53f32mr612723pfb.66.1704888362874;
        Wed, 10 Jan 2024 04:06:02 -0800 (PST)
Received: from [10.255.187.86] ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id i128-20020a625486000000b006d99056c4edsm3470845pfb.187.2024.01.10.04.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 04:06:02 -0800 (PST)
Message-ID: <abcc18ec-4006-4c51-96a8-e61d0ec2f092@bytedance.com>
Date: Wed, 10 Jan 2024 20:05:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] [PATCH 5/6] cachefiles: Fix signed/unsigned mixup
To: David Howells <dhowells@redhat.com>,
 Christian Brauner <christian@brauner.io>, Jeff Layton <jlayton@kernel.org>,
 Gao Xiang <hsiangkao@linux.alibaba.com>,
 Dominique Martinet <asmadeus@codewreck.org>
Cc: Steve French <smfrench@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Marc Dionne <marc.dionne@auristor.com>, Paulo Alcantara <pc@manguebit.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, kernel test robot <lkp@intel.com>,
 Yiqun Leng <yqleng@linux.alibaba.com>, zhujia.zj@bytedance.com
References: <20240109112029.1572463-1-dhowells@redhat.com>
 <20240109112029.1572463-6-dhowells@redhat.com>
From: "'Jia Zhu' via linux-cachefs@redhat.com" <linux-cachefs@redhat.com>
In-Reply-To: <20240109112029.1572463-6-dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: zhujia.zj@bytedance.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of zhujia.zj@bytedance.com designates 209.85.210.181 as permitted
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

Tested-by: Jia Zhu <zhujia.zj@bytedance.com>

=E5=9C=A8 2024/1/9 19:20, David Howells =E5=86=99=E9=81=93:
> In __cachefiles_prepare_write(), the start and pos variables were made
> unsigned 64-bit so that the casts in the checking could be got rid of -
> which should be fine since absolute file offsets can't be negative, excep=
t
> that an error code may be obtained from vfs_llseek(), which *would* be
> negative.  This breaks the error check.
>=20
> Fix this for now by reverting pos and start to be signed and putting back
> the casts.  Unfortunately, the error value checks cannot be replaced with
> IS_ERR_VALUE() as long might be 32-bits.
>=20
> Fixes: 7097c96411d2 ("cachefiles: Fix __cachefiles_prepare_write()")
> Reported-by: Simon Horman <horms@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401071152.DbKqMQMu-lkp@i=
ntel.com/
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> cc: Gao Xiang <hsiangkao@linux.alibaba.com>
> cc: Yiqun Leng <yqleng@linux.alibaba.com>
> cc: Jia Zhu <zhujia.zj@bytedance.com>
> cc: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-erofs@lists.ozlabs.org
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>   fs/cachefiles/io.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
> index 3eec26967437..9a2cb2868e90 100644
> --- a/fs/cachefiles/io.c
> +++ b/fs/cachefiles/io.c
> @@ -522,7 +522,7 @@ int __cachefiles_prepare_write(struct cachefiles_obje=
ct *object,
>   			       bool no_space_allocated_yet)
>   {
>   	struct cachefiles_cache *cache =3D object->volume->cache;
> -	unsigned long long start =3D *_start, pos;
> +	loff_t start =3D *_start, pos;
>   	size_t len =3D *_len;
>   	int ret;
>  =20
> @@ -556,7 +556,7 @@ int __cachefiles_prepare_write(struct cachefiles_obje=
ct *object,
>   					  cachefiles_trace_seek_error);
>   		return pos;
>   	}
> -	if (pos >=3D start + *_len)
> +	if ((u64)pos >=3D (u64)start + *_len)
>   		goto check_space; /* Unallocated region */
>  =20
>   	/* We have a block that's at least partially filled - if we're low on
> @@ -575,7 +575,7 @@ int __cachefiles_prepare_write(struct cachefiles_obje=
ct *object,
>   					  cachefiles_trace_seek_error);
>   		return pos;
>   	}
> -	if (pos >=3D start + *_len)
> +	if ((u64)pos >=3D (u64)start + *_len)
>   		return 0; /* Fully allocated */
>  =20
>   	/* Partially allocated, but insufficient space: cull. */
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-cachefs+unsubscribe@redhat.com.


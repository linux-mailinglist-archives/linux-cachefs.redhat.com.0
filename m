Return-Path: <linux-cachefs+bncBCXIHK4S6EJRB2NP2CWAMGQEKXLFX3Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E5E821D44
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Jan 2024 15:04:26 +0100 (CET)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-db402e6f61dsf11018879276.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 02 Jan 2024 06:04:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704204265; cv=pass;
        d=google.com; s=arc-20160816;
        b=NgG9pnaD0YoOT5hUMwndCaHGYyo2rTNmrs/e/xsSpIAHF1IHVjyogjY+tEkConNjDT
         lWmQbZjZbIF6gmRT640A906Cfc1MC1f5ljeI4unMbrM6BmUkrWfv6iF9qEKY5E1iSr06
         2ptAk/RHED59o5RP7DNd+7cMSZcV6t0Q55YGtKPaHbXWrLwKAKLu+Ytt15pSgyYbLshI
         d5k8sR8ls8opCBT9tKJVF6SNDWpxB0pQB8oj7TsE97NSzdVNdwtdfn8MRiciD0Eiy/Jo
         PmvdkHlaHZoG8cp/dtuiVuwF7uTBtY4rc+uMA/rkeUzBJZMbrn1MaSsIKp+lEDynhraA
         9L7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=uuGQpMUCxSk4TEVk0cKFjBMNpREJyIfFX2KV/y7h/H4=;
        fh=stGEWgWyf+JTuHf1Tm+RxwFUEwp72MLxA4B5feIA99A=;
        b=X76oA6U9dgv4LOQ+S+ddBghj9Qql8w1agjW7WEYE5H7bq/8fEUPFdRad6D4zOvaJJA
         mkOIHGLFbiIir5a09J7z69QsTFHNcJRTeM/0vnOtR2NSMbnUCfwFU2g/GHX5x5kezWSt
         M7TbVTTQQgX39IToaL4OCJ5daF0wnPFK8uZx3GKMbqEGEVtvwohIiN++Y2WXBmuV/eAk
         2/g8i+IhX2TWeLi//elBYbAr0bQDibdJPTNoEG3jDk5VU+OmQOVApi+RLC6hb0LUG30E
         shF0LSQvkhUNOEn/tB4xBK87499tMYjw6WZPVSq9bGTaiCSdhiTN12Y7njb0X3PMC0jZ
         rFvQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.133 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704204265; x=1704809065;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuGQpMUCxSk4TEVk0cKFjBMNpREJyIfFX2KV/y7h/H4=;
        b=b78RcoIGlQgZjDPnVwWt2PDMncFA/iTHzfmSmlTq8me7GGH3pt2qeTEmJIV99dKJ5t
         rGoplbLZFcM/amQjtAfdroPmCVHEb5he3OtVIkd6ADqoHb34kY+q0zmK1DG14ogaD0gv
         9Ib6iBAyHUZf5vBucm0+lk5oz7WC3EVl3hOS5gJfd0GeZs/e864C1DUVY4FxLxL9lJmo
         mU1NsLjpsZg7G/G3bJeCR1iV8TYvtQ/Y561MsuBO9FaPU1NfddsTVgAXjyEtXqEv0s0h
         jC/iMcvn61/g9EXcmumLeFtq+8JSkdcxWWN/9VkHZtx/yuT1Ob4PQaI1YumXyAM7m/fu
         tpPA==
X-Gm-Message-State: AOJu0YwLcUXKrOQ4rPjQ0jZE0+eUw7O4GVxavcMhbBwmNqMUtCt9MD5r
	6IZH4v4EJoXEyVpOf9gD74IQu2RcTnUHNA==
X-Google-Smtp-Source: AGHT+IGj1QECdsvf1xMeGpdhx36QHqZqwpEbmE3rOwdHWOZKdg3dCthUQoXO2Ei6UMUYdv5QX1/mEg==
X-Received: by 2002:a25:8403:0:b0:dbd:b754:7e3e with SMTP id u3-20020a258403000000b00dbdb7547e3emr7797124ybk.115.1704204265562;
        Tue, 02 Jan 2024 06:04:25 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:cc01:0:b0:dbd:b014:5ca2 with SMTP id l1-20020a25cc01000000b00dbdb0145ca2ls1890397ybf.2.-pod-prod-08-us;
 Tue, 02 Jan 2024 06:04:24 -0800 (PST)
X-Received: by 2002:a25:2d1f:0:b0:dbd:aeac:ec1e with SMTP id t31-20020a252d1f000000b00dbdaeacec1emr9170275ybt.116.1704204264698;
        Tue, 02 Jan 2024 06:04:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704204264; cv=none;
        d=google.com; s=arc-20160816;
        b=RWta8XZJ+oVKYyBFIXqPPitbhAtNNW5Q10yUfLsOdDg7L3X0DOiwPTzNnR9ujrU7Io
         GcdXQ/nQMyaUlFA2yASlocbuVRyBSlQ/fvdTFYl3QzEKTMNO80PWM9AMgU99bJiI5Uq+
         fTtNVo3GqpUpBPR6TBodwsEANRcn02VCmvL+bl1dcbuflefJkwZWXF2BwBUEn/yCirzS
         Og6e+9KkT+DtG9VG3yTdkeVFOlJj+3wBoQy48JTXxfyh+oRMOxTF1HXFzsmoicPKpEnX
         BCsIxVmAGfAo8a5PY+b0W0UuxlB//RBMD5uOR2PZQb56dxPFylNeQmy4bivrnG8i33r6
         W2pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=jHtxspFYMXLgbsoHlUfpova+2SNX3zK7sveiyj8ThoY=;
        fh=stGEWgWyf+JTuHf1Tm+RxwFUEwp72MLxA4B5feIA99A=;
        b=Hj07RNk7DnfwZVLlhD3kljy4OE+KdWS/OeZdrbimf7I7e6GM16ULZVGkx1/wQN7GdV
         QIP7OnxcTMSYUZ1C9nJ35xF4upEjsqICqxAEBN5AjDl7pX0H30pelAYtS0W7l0u+azYr
         /CrpbRYmhDbM15ryRMpRLYgPwWSX8/oK0P+rPE9PgRE02wQ5eQge2b+RaMNZVpEekbif
         GxQxo74cN1x1L+a/br7vLKKQoz0EgD5J0PjdqDYjIeVHH5GW8IVAtjSzAMQp9o07Fe+1
         dQ8duSgIsjTRnDj/APCNj5NAU2yHOMoWIlDU9nSZ84cG9RDhTIwmaPkcHL/wV4J78LeW
         Eesg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.133 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id k190-20020a253dc7000000b00dbd751f7c08si11943735yba.85.2024.01.02.06.04.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:04:24 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.133 as permitted sender) client-ip=115.124.30.133;
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-3-ebvm995xNry4b3KG4OD4jQ-1; Tue,
 02 Jan 2024 09:04:23 -0500
X-MC-Unique: ebvm995xNry4b3KG4OD4jQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F415529AC00E
	for <linux-cachefs@gapps.redhat.com>; Tue,  2 Jan 2024 14:04:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id F08A8492BC6; Tue,  2 Jan 2024 14:04:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9FCF492BC8
	for <linux-cachefs@redhat.com>; Tue,  2 Jan 2024 14:04:22 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9A13836F25
	for <linux-cachefs@redhat.com>; Tue,  2 Jan 2024 14:04:22 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
 (out30-133.freemail.mail.aliyun.com [115.124.30.133]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-439-i6yvwzYCOZihPy3dP4zP_A-1; Tue, 02 Jan 2024 09:04:20 -0500
X-MC-Unique: i6yvwzYCOZihPy3dP4zP_A-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=22;SR=0;TI=SMTPD_---0VzqtEDH_1704204253
Received: from 192.168.33.9(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0VzqtEDH_1704204253)
          by smtp.aliyun-inc.com;
          Tue, 02 Jan 2024 22:04:14 +0800
Message-ID: <750e8251-ba30-4f53-a17b-73c79e3739ce@linux.alibaba.com>
Date: Tue, 2 Jan 2024 22:04:12 +0800
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
 Steve French <smfrench@gmail.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
 <20231221132400.1601991-34-dhowells@redhat.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <20231221132400.1601991-34-dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 115.124.30.133 as permitted
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

Hi David,

On 2023/12/21 21:23, David Howells wrote:
> Make netfslib pass the maximum length to the ->prepare_write() op to tell
> the cache how much it can expand the length of a write to.  This allows a
> write to the server at the end of a file to be limited to a few bytes
> whilst writing an entire block to the cache (something required by direct
> I/O).
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> cc: linux-cachefs@redhat.com
> cc: linux-fsdevel@vger.kernel.org
> cc: linux-mm@kvack.org
> ---
>   fs/cachefiles/internal.h |  2 +-
>   fs/cachefiles/io.c       | 10 ++++++----
>   fs/cachefiles/ondemand.c |  2 +-
>   fs/netfs/fscache_io.c    |  2 +-
>   fs/netfs/io.c            |  2 +-
>   fs/netfs/objects.c       |  1 +
>   fs/netfs/output.c        | 25 ++++++++++---------------
>   fs/smb/client/fscache.c  |  2 +-
>   include/linux/netfs.h    |  5 +++--
>   9 files changed, 25 insertions(+), 26 deletions(-)
> 
> diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
> index 2ad58c465208..1af48d576a34 100644
> --- a/fs/cachefiles/internal.h
> +++ b/fs/cachefiles/internal.h
> @@ -233,7 +233,7 @@ extern bool cachefiles_begin_operation(struct netfs_cache_resources *cres,
>   				       enum fscache_want_state want_state);
>   extern int __cachefiles_prepare_write(struct cachefiles_object *object,
>   				      struct file *file,
> -				      loff_t *_start, size_t *_len,
> +				      loff_t *_start, size_t *_len, size_t upper_len,
>   				      bool no_space_allocated_yet);
>   extern int __cachefiles_write(struct cachefiles_object *object,
>   			      struct file *file,
> diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
> index 009d23cd435b..bffffedce4a9 100644
> --- a/fs/cachefiles/io.c
> +++ b/fs/cachefiles/io.c
> @@ -518,7 +518,7 @@ cachefiles_prepare_ondemand_read(struct netfs_cache_resources *cres,
>    */
>   int __cachefiles_prepare_write(struct cachefiles_object *object,
>   			       struct file *file,
> -			       loff_t *_start, size_t *_len,
> +			       loff_t *_start, size_t *_len, size_t upper_len,
>   			       bool no_space_allocated_yet)
>   {
>   	struct cachefiles_cache *cache = object->volume->cache;
> @@ -530,6 +530,8 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
>   	down = start - round_down(start, PAGE_SIZE);
>   	*_start = start - down;
>   	*_len = round_up(down + len, PAGE_SIZE);
> +	if (down < start || *_len > upper_len)
> +		return -ENOBUFS;

Sorry for bothering. We just found some strange when testing
today-next EROFS over fscache.

I'm not sure the meaning of
     if (down < start

For example, if start is page-aligned, down == 0.

so as long as start > 0 and page-aligned, it will return
-ENOBUFS.  Does it an intended behavior?

Thanks,
Gao Xiang

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


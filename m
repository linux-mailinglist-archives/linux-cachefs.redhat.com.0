Return-Path: <linux-cachefs+bncBDW27WM2ZQPRB45WTGWAMGQE63CS65I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5381D20E
	for <lists+linux-cachefs@lfdr.de>; Sat, 23 Dec 2023 05:00:53 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4279625273csf37530821cf.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 22 Dec 2023 20:00:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703304052; cv=pass;
        d=google.com; s=arc-20160816;
        b=vWIOfWCvJc1vSchEA7bX1MJwJCSD2aKQG5zKXRWcAhPau7eeauJzoEaXUGXAeay1+e
         2F489QPfGuYGTTaVjjVezP1g0ApXXFc4ETU2Mo48sXfEjK8rbXQJMjDTB5rybPHcFeTe
         eHuvXcSMOtMUSsWD9u4Ozx1faLUX1rZsOA5trafMYRboAl/4frzFaXQ0yjHmw7i+Yuvd
         2TfzsQ5VHPwH/NGwFo/GVplgtDrHxxb93niK4afCp8mvpgEcsM6Y7Y9x65XA8OPp/2Re
         S7eXRZC4bkYHfYsvaZW+wZ9hr2QNCxJSoS2aNo1GZNMOLN9hkxC8K0u6vENhHMd98CD3
         SnTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :delivered-to;
        bh=Vd3nDFrgkfUhG9ZaIbB4+OiE4n+J3O5VSHsBKFnMQs8=;
        fh=g6+a6MuhGPe5hWSxNkR1y/YkfS3uHNuC6Nb7ZNd2Sn4=;
        b=zgPRqnmZrbg6mC6Q+3MKZA/Xi73hCGERAEVzdVtiasRJy1MfRAxbTCL8OGfSAaZP7K
         r9wfWWfAFRiXsOhnQcXtSMs5qkBoBoAIA72VVy0/mft6qN7+LncBAUoKuWqqGb/p3MgN
         5dYGm1I2Zgx1999b9f2UTRWKfEJYpCBWe/1byICOcgNPqBLnvzXnYissCgsm+pW/thkS
         HD7pAnQkBWyVfv54zuiTvvmYCnPnfRK4fWqajr3K9MSqehcEGylU03Wu/HeeQEZl/rM3
         AqSR+Wvq+6DTF97Ggr9HC7xIbLa6iMKR7OJVahQNYShcHksrM6OSF2i/hSHJfMaWocTm
         oWOg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of jefflexu@linux.alibaba.com designates 115.124.30.111 as permitted sender) smtp.mailfrom=jefflexu@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703304052; x=1703908852;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd3nDFrgkfUhG9ZaIbB4+OiE4n+J3O5VSHsBKFnMQs8=;
        b=wLZzGkP3wCqB3MKRpZbu3DAYSYG0IiyLIwZa+jbStMXNWWSXb50JXtES8Ni/uAkUka
         B3uxr9gXP8FwvdF4Ce/y1qA8nzBz24Iyw2EsYPqRNf8fdxAc/G2ICTDIY6AIBIR6ydvI
         CfNey5MXfHhrGPf25zyLsS9aCa0VylnFiFC3Xm1a+/VbHYjcBV6ue1cnMoKD+IvNX8jw
         C2tBxSz3W4wXeqRteiEDPyO9cpYZyjKHQRj5R1+L8TYLBiV5rxNrQvbVfGOwT7+DCSwn
         APTTnQ5Lw8oUlMAmNLEuSNsjituWNB29DSrOjPquriGzsXo/Jw8uicSc9j61ZyI1D8Mk
         9DSg==
X-Gm-Message-State: AOJu0Yz7phxGaS0cW0S9vSDEZeoOegY7QgBMPNdsaaOJI13HSi3UqBdt
	ZzQ3U+pRTCga4DJND/HFcJCi9TfpkLu3yHDeE06HJQ==
X-Google-Smtp-Source: AGHT+IFEoflzZCJ09MgDq9xuNhYjoN9kpUgHGs+Pw+LUfWeL8dFmMlA64T8w0c9XzrBN4qVbDlFZ6g==
X-Received: by 2002:a05:622a:28a:b0:427:922f:42a9 with SMTP id z10-20020a05622a028a00b00427922f42a9mr3781801qtw.116.1703304051972;
        Fri, 22 Dec 2023 20:00:51 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7fc3:0:b0:427:a913:8cf9 with SMTP id b3-20020ac87fc3000000b00427a9138cf9ls967926qtk.0.-pod-prod-06-us;
 Fri, 22 Dec 2023 20:00:51 -0800 (PST)
X-Received: by 2002:a05:622a:429b:b0:427:8fcf:52c5 with SMTP id cr27-20020a05622a429b00b004278fcf52c5mr2583660qtb.81.1703304031331;
        Fri, 22 Dec 2023 20:00:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703304031; cv=none;
        d=google.com; s=arc-20160816;
        b=XaOhQPr1xQb13KQhR+mYGMxNosJXpZ+N29qUkvXLL8swWnUEpB0x+ldIAb44hK3ZlX
         dMk5A2kc7nv3f3sRWtck0ub6nIrkQVGvg+Q1vAMj1Sa/Jo2jomHaOQtJxeS/kpFJsTHc
         wBbNuPk9C+OfUyEiqSJxyYkWGlqIXi5V1iM9vbARaXnbwNdeAduqd5tuFykkYjASljMk
         Mk0J8lrEJEN1rL7vIA7nrBuUVw8JY9vIGHLa9E7PzvE4Ad00QqhX2gHI8BfZlsPaK41T
         IyGt3SNE9BkaHeIWgW1BSQk4eZtV8dkfFWzci2JR9Z/AXfN6wqCBEND8hA9ZR7XdU5Wm
         vRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :delivered-to;
        bh=NEf9HXwZygPHUviPlg0/8AyPny5bHkZ3873Q9WPx/gY=;
        fh=g6+a6MuhGPe5hWSxNkR1y/YkfS3uHNuC6Nb7ZNd2Sn4=;
        b=OsZV29bS8bApiwfTMS8rECwcJ6Inev1fObJ/bh63VmjZy9Sp4zY2GbHtI5NSt1H1PY
         Qo3uRwc21Ob1zyLl1RlJgxf8OUhtXG0sXuA2wfcU35KqKa76NPR65aSZKE09MRvEJgLQ
         FExqg9K5CVopFogg9gKjYluSzLIMcdDa5l1TaXKCBb2wwSv9EFFjEoXBdZxlKQt/3kH/
         a6HWfLg6JRK38tDOzRS7jz+dY0Vrwu33n2jFtX7uVbmdIS9rv6Yn6NC6EC1xPAeQGOsE
         cidRzKOnV18zX96qw9IiWCPmU9BKFrobRhAFkCERfn4KU/VOXR5ZUfhHcF1fsp8DzUmR
         NZiw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jefflexu@linux.alibaba.com designates 115.124.30.111 as permitted sender) smtp.mailfrom=jefflexu@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id z16-20020a05622a029000b00425b265c0a5si5785846qtw.696.2023.12.22.20.00.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 20:00:31 -0800 (PST)
Received-SPF: pass (google.com: domain of jefflexu@linux.alibaba.com designates 115.124.30.111 as permitted sender) client-ip=115.124.30.111;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-tA6n59OXOxaVEdYDKMTjbw-1; Fri, 22 Dec 2023 23:00:29 -0500
X-MC-Unique: tA6n59OXOxaVEdYDKMTjbw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85B38185A781
	for <linux-cachefs@gapps.redhat.com>; Sat, 23 Dec 2023 04:00:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8282F1121313; Sat, 23 Dec 2023 04:00:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AEAA1121306
	for <linux-cachefs@redhat.com>; Sat, 23 Dec 2023 04:00:29 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55B8F85A588
	for <linux-cachefs@redhat.com>; Sat, 23 Dec 2023 04:00:29 +0000 (UTC)
Received: from out30-111.freemail.mail.aliyun.com
 (out30-111.freemail.mail.aliyun.com [115.124.30.111]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-189-hhjLqpuqMTSqt-PANHCdnA-1; Fri, 22 Dec 2023 23:00:26 -0500
X-MC-Unique: hhjLqpuqMTSqt-PANHCdnA-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=jefflexu@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0Vz0J.hE_1703303701
Received: from 30.212.153.241(mailfrom:jefflexu@linux.alibaba.com fp:SMTPD_---0Vz0J.hE_1703303701)
          by smtp.aliyun-inc.com;
          Sat, 23 Dec 2023 11:55:04 +0800
Message-ID: <d50555e9-3b8e-41d4-bec6-317aaaec5ff0@linux.alibaba.com>
Date: Sat, 23 Dec 2023 11:55:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix EROFS Kconfig
To: David Howells <dhowells@redhat.com>, Gao Xiang <xiang@kernel.org>
Cc: Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Steve French <smfrench@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Marc Dionne <marc.dionne@auristor.com>, Paulo Alcantara <pc@manguebit.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Eric Van Hensbergen <ericvh@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 Jeff Layton <jlayton@kernel.org>
References: <20231221132400.1601991-5-dhowells@redhat.com>
 <20231221132400.1601991-1-dhowells@redhat.com>
 <2265065.1703250126@warthog.procyon.org.uk>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <2265065.1703250126@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: jefflexu@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of jefflexu@linux.alibaba.com designates 115.124.30.111 as permitted
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

Hi,

On 12/22/23 9:02 PM, David Howells wrote:
> This needs an additional change (see attached).
> 
> diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
> index 1d318f85232d..1949763e66aa 100644
> --- a/fs/erofs/Kconfig
> +++ b/fs/erofs/Kconfig
> @@ -114,7 +114,8 @@ config EROFS_FS_ZIP_DEFLATE
>  
>  config EROFS_FS_ONDEMAND
>  	bool "EROFS fscache-based on-demand read support"
> -	depends on CACHEFILES_ONDEMAND && (EROFS_FS=m && FSCACHE || EROFS_FS=y && FSCACHE=y)
> +	depends on CACHEFILES_ONDEMAND && FSCACHE && \
> +		(EROFS_FS=m && NETFS_SUPPORT || EROFS_FS=y && NETFS_SUPPORT=y)
>  	default n
>  	help
>  	  This permits EROFS to use fscache-backed data blobs with on-demand
> 

Thanks for the special reminder.  I noticed that it has been included in
this commit[*] in the dev tree.

[*]
https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=netfs-lib&id=7472173cc3baf4a0bd8c803e56c37efdb8388f1c


Besides I noticed an issue when trying to configure EROFS_FS_ONDEMAND.
The above kconfig indicates that EROFS_FS_ONDEMAND depends on
NETFS_SUPPORT, while NETFS_SUPPORT has no prompt in menuconfig and can
only be selected by, e.g. fs/ceph/Kconfig:

	config CEPH_FS
        select NETFS_SUPPORT

IOW EROFS_FS_ONDEMAND will not be prompted and has no way being
configured if NETFS_SUPPORT itself is not selected by any other filesystem.


I tried to fix this in following way:

diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
index 1949763e66aa..5b7b71e537f1 100644
--- a/fs/erofs/Kconfig
+++ b/fs/erofs/Kconfig
@@ -5,6 +5,7 @@ config EROFS_FS
        depends on BLOCK
        select FS_IOMAP
        select LIBCRC32C
+       select NETFS_SUPPORT if EROFS_FS_ONDEMAND
        help
          EROFS (Enhanced Read-Only File System) is a lightweight read-only
          file system with modern designs (e.g. no buffer heads, inline
@@ -114,8 +115,10 @@ config EROFS_FS_ZIP_DEFLATE

 config EROFS_FS_ONDEMAND
        bool "EROFS fscache-based on-demand read support"
-       depends on CACHEFILES_ONDEMAND && FSCACHE && \
-               (EROFS_FS=m && NETFS_SUPPORT || EROFS_FS=y &&
NETFS_SUPPORT=y)
+       depends on EROFS_FS
+       select FSCACHE
        default n
        help
          This permits EROFS to use fscache-backed data blobs with on-demand


But still the dependency for CACHEFILES_ONDEMAND and CACHEFILES can not
be resolved.  Though CACHEFILES is not a must during the linking stage
as EROFS only calls fscache APIs directly, CACHEFILES is indeed needed
to ensure that the EROFS on-demand functionality works at runtime.

If we let EROFS_FS_ONDEMAND select CACHEFILES_ONDEMAND, then only
CACHEFILES_ONDEMAND will be selected while CACHEFILES can be still N.
Maybe EROFS_FS_ONDEMAND needs to selct both CACHEFILES_ONDEMAND and
CACHEFILES?

Besides if we make EROFS_FS_ONDEMAND depends on CACHEFILES_ONDEMAND,
then there will be a recursive dependency loop, as

fs/netfs/Kconfig:3:error: recursive dependency detected!
fs/netfs/Kconfig:3:	symbol NETFS_SUPPORT is selected by EROFS_FS_ONDEMAND
fs/erofs/Kconfig:116:	symbol EROFS_FS_ONDEMAND depends on
CACHEFILES_ONDEMAND
fs/cachefiles/Kconfig:30:	symbol CACHEFILES_ONDEMAND depends on CACHEFILES
fs/cachefiles/Kconfig:3:	symbol CACHEFILES depends on NETFS_SUPPORT


Hi Xiang, any better idea?



-- 
Thanks,
Jingbo

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


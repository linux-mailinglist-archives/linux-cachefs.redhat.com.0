Return-Path: <linux-cachefs+bncBCXIHK4S6EJRBJGFTOWAMGQEHBEMFFY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3D981D435
	for <lists+linux-cachefs@lfdr.de>; Sat, 23 Dec 2023 14:37:41 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67f98fd5823sf16835876d6.2
        for <lists+linux-cachefs@lfdr.de>; Sat, 23 Dec 2023 05:37:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703338660; cv=pass;
        d=google.com; s=arc-20160816;
        b=CdqLPYCXCJAclssmQZk/4sFgLl92mDQaOM/4FgIEEs641xwT/2VuZ2qoaXia1TlO2B
         r0Elbf5WDE5iJB1yNCs6n8VDb80ojEt3SAKOHKxMAbUsADiWooKbHMb4NOfZtwTWwlho
         25/KVDL4O7iYl/gkSnpyzTAUgTorqctGTD9i14meB1Gr5eDZJVnE689WGwb7Luy4C+u5
         BDKPw0/DnGNmMO2uV1PvlnGNhCOiePDcV6ZMflAteI1qQP3bdMYH26k7VhmdlAGZnKZH
         /BIRHpYMwIRIYZZclDvnGVl/oMaFZ5X8l3ZruxfCmCKaNtl8Q2eeacbbs6vHQLCFmpDN
         N3CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=NFkk96SVfV/bzi9D6V0wof+8yCCZGe9Uq04ekCkJeho=;
        fh=at6sTlwsco5lvpfZ8jI/x7lZGurq4GevZwAdgJcl/6I=;
        b=HEFVdRILyAdaYyxMWA+tReJ4R7ae1fLhtHmq5C/cEAADaVnpCD0/509ClmnAB6LYEJ
         ewWcQdNWm+PxrIue32ZPSFVwmnZmuBbRiVlzN293C3jiZB+zVf77gvnu96+V6ersHmD4
         bj123O37bH7TFRE2XaZyFGx7G6LJgnYZjg+ThgKWuWS1qu4oAvrE5VN2fKIYhZD/AA80
         /NAOMN1t4QkwGCmjuzIEzaca5eWkypw0B5VT7Z6HUQdT8/PZBqK3R8bHXi3P6VmRxrsn
         LQudGhbOCn1+Fi7QEQngEoNehP7jSSC4ywuu7JfiWBYjA9VR0vfFRPdAq1A4EN9Clj2k
         x36Q==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.130 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703338660; x=1703943460;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFkk96SVfV/bzi9D6V0wof+8yCCZGe9Uq04ekCkJeho=;
        b=QpajNUS9JMvcrYgQh4hyHeTRLagT06gWiP82niRVqWNV/zULeCvaGI3NJH4cDPaA+x
         gGxH1Bx7PeoADv55GPBnKDCjrR2EmrbweiCQQ4nYTGTH9qwN+deYAc7lae+vQlZh28zv
         FA1+DfUsvVNwz0sBO1xRYdCXxHb9dDF0++Z16do6FrXwkO2Dia/4rNrUL8+GXIfj2tm5
         EAxeGWUyXmKhH9r/NjzOISTVo4enmOmj/4TQKhvj4AsRAbMdMOi5l1WJSHJNM2wHC3Ll
         ofgL9h9oSP35dhlTyVk0/cBdNQ5i9akIdqRuBiwmfaovyIHlahjqS52jWdsrKyBEB2Vx
         DnTg==
X-Gm-Message-State: AOJu0YxJDwMs50jappE/pfcrYG9QHkOOukNNoftOPRJG+q2xqEZeOxm4
	P9Scq4xZIbGjvs/8OohQxk5YcbcsgFqq9Q==
X-Google-Smtp-Source: AGHT+IFaTEWGTFiEvO1GKAz7uQdcb3xIxsIIvKFDH51CjwhTfmLHLcdRp8xr2xOXv7Hre90kZUIdOQ==
X-Received: by 2002:ad4:5963:0:b0:67f:40d3:c9ee with SMTP id eq3-20020ad45963000000b0067f40d3c9eemr3811338qvb.78.1703338660652;
        Sat, 23 Dec 2023 05:37:40 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c6a:0:b0:67f:da:bf48 with SMTP id i10-20020ad45c6a000000b0067f00dabf48ls3376455qvh.1.-pod-prod-08-us;
 Sat, 23 Dec 2023 05:37:39 -0800 (PST)
X-Received: by 2002:a05:620a:1596:b0:77d:a0ca:8ad9 with SMTP id d22-20020a05620a159600b0077da0ca8ad9mr2870435qkk.25.1703338659676;
        Sat, 23 Dec 2023 05:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703338659; cv=none;
        d=google.com; s=arc-20160816;
        b=MgRvl7F10NddYoCw9Gnzre5UNSzRrSnOWl0XpnAbsr0AC7f+kZ0NMtoaNRqxiM/4IK
         pC/EOVSI+pQV24ZBbFFdDCEkEKcXqX1E71KXZjjwhSFNP+z7mBjPnUHLh/7zKQND/tO3
         0vr52yAV+ccWDYSM8Yeco9kg0VTEuEJS4s8y23RunDbjZix5zr9lekFY/Xx3ehvECFXU
         sSd9Gucp2Ixfx/CMRNbNyEeJ9lBly9roRCBaj18bndiy04Rrsxz3lO+RNsZzIlMuCAPJ
         rLPPUG5pL1/YbPEj13IgUUKpp5EeMX0//PvzsCi68FxIWanbaFreZr23HmTya2nigvCh
         KqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:delivered-to;
        bh=mHtLgD4vL+XswVBYByVqVHM5FfBvinzzdh5hkBKfVE8=;
        fh=at6sTlwsco5lvpfZ8jI/x7lZGurq4GevZwAdgJcl/6I=;
        b=U5NHx1M+Ooekl5DZieJfohC3kov9AA8xHMjFuQfKKVIo8bXky9RHOlp5lH8mXFVjfn
         xhDzSgQ8K+/MxrG3sfHbFsdvUe/xaYYUElcCzS++POt//MuQBM+eTldi9ThQT3SdW3iT
         4M4DZC+KMKEs9uXAFa53ffqAjwVZYfjidYgDNKBMbkdUwNLEBlckb4jo+DCVmVN7rxOL
         c3VJhoV0wHL8uh317qSGjy0ZN/WDwZFo84oHpmdgxlkNnJu/3BGaRppgntEyUo43XMv8
         NfwQpuSt8B0IK4lKhNnZFonZ8zLir3Tja17o1dEbPpjWnRgVnKCN20WJE0Gdeh/SgLKP
         NDfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.130 as permitted sender) smtp.mailfrom=hsiangkao@linux.alibaba.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id x3-20020a05620a448300b0077fc069244bsi7110162qkp.171.2023.12.23.05.37.39
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 05:37:39 -0800 (PST)
Received-SPF: pass (google.com: domain of hsiangkao@linux.alibaba.com designates 115.124.30.130 as permitted sender) client-ip=115.124.30.130;
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-MCTOhOPvMJmCXfpL223nmQ-1; Sat, 23 Dec 2023 08:37:38 -0500
X-MC-Unique: MCTOhOPvMJmCXfpL223nmQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E416885A58F
	for <linux-cachefs@gapps.redhat.com>; Sat, 23 Dec 2023 13:37:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DFC1040C6EB9; Sat, 23 Dec 2023 13:37:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D91B940C6E2B
	for <linux-cachefs@redhat.com>; Sat, 23 Dec 2023 13:37:37 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6D633816B4C
	for <linux-cachefs@redhat.com>; Sat, 23 Dec 2023 13:37:37 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384)
 id us-mta-127-GXSmBFvTPyGtafhxApCthQ-1; Sat, 23 Dec 2023 08:37:35 -0500
X-MC-Unique: GXSmBFvTPyGtafhxApCthQ-1
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0Vz1O0tF_1703338328
Received: from 30.25.242.252(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Vz1O0tF_1703338328)
          by smtp.aliyun-inc.com;
          Sat, 23 Dec 2023 21:32:11 +0800
Message-ID: <fac01751-73dc-4d93-b9c0-b637fece8334@linux.alibaba.com>
Date: Sat, 23 Dec 2023 21:32:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix EROFS Kconfig
To: Jingbo Xu <jefflexu@linux.alibaba.com>,
 David Howells <dhowells@redhat.com>, Gao Xiang <xiang@kernel.org>
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
 <d50555e9-3b8e-41d4-bec6-317aaaec5ff0@linux.alibaba.com>
From: Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <d50555e9-3b8e-41d4-bec6-317aaaec5ff0@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection Definition;Similar Internal Domain=false;Similar Monitored External Domain=false;Custom External Domain=false;Mimecast External Domain=false;Newly Observed Domain=false;Internal User Name=false;Custom Display Name List=false;Reply-to Address Mismatch=false;Targeted Threat Dictionary=false;Mimecast Threat Dictionary=false;Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-Original-Sender: hsiangkao@linux.alibaba.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain of hsiangkao@linux.alibaba.com designates 115.124.30.130 as permitted
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

Hi David and Jingbo,

On 2023/12/23 11:55, Jingbo Xu wrote:
> Hi,
> 
> On 12/22/23 9:02 PM, David Howells wrote:
>> This needs an additional change (see attached).
>>
>> diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
>> index 1d318f85232d..1949763e66aa 100644
>> --- a/fs/erofs/Kconfig
>> +++ b/fs/erofs/Kconfig
>> @@ -114,7 +114,8 @@ config EROFS_FS_ZIP_DEFLATE
>>   
>>   config EROFS_FS_ONDEMAND
>>   	bool "EROFS fscache-based on-demand read support"
>> -	depends on CACHEFILES_ONDEMAND && (EROFS_FS=m && FSCACHE || EROFS_FS=y && FSCACHE=y)
>> +	depends on CACHEFILES_ONDEMAND && FSCACHE && \
>> +		(EROFS_FS=m && NETFS_SUPPORT || EROFS_FS=y && NETFS_SUPPORT=y)
>>   	default n
>>   	help
>>   	  This permits EROFS to use fscache-backed data blobs with on-demand
>>
> 
> Thanks for the special reminder.  I noticed that it has been included in
> this commit[*] in the dev tree.
> 
> [*]
> https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?h=netfs-lib&id=7472173cc3baf4a0bd8c803e56c37efdb8388f1c
> 
> 
> Besides I noticed an issue when trying to configure EROFS_FS_ONDEMAND.
> The above kconfig indicates that EROFS_FS_ONDEMAND depends on
> NETFS_SUPPORT, while NETFS_SUPPORT has no prompt in menuconfig and can
> only be selected by, e.g. fs/ceph/Kconfig:
> 
> 	config CEPH_FS
>          select NETFS_SUPPORT
> 
> IOW EROFS_FS_ONDEMAND will not be prompted and has no way being
> configured if NETFS_SUPPORT itself is not selected by any other filesystem.
> 
> 
> I tried to fix this in following way:
> 
> diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
> index 1949763e66aa..5b7b71e537f1 100644
> --- a/fs/erofs/Kconfig
> +++ b/fs/erofs/Kconfig
> @@ -5,6 +5,7 @@ config EROFS_FS
>          depends on BLOCK
>          select FS_IOMAP
>          select LIBCRC32C
> +       select NETFS_SUPPORT if EROFS_FS_ONDEMAND
>          help
>            EROFS (Enhanced Read-Only File System) is a lightweight read-only
>            file system with modern designs (e.g. no buffer heads, inline
> @@ -114,8 +115,10 @@ config EROFS_FS_ZIP_DEFLATE
> 
>   config EROFS_FS_ONDEMAND
>          bool "EROFS fscache-based on-demand read support"
> -       depends on CACHEFILES_ONDEMAND && FSCACHE && \
> -               (EROFS_FS=m && NETFS_SUPPORT || EROFS_FS=y &&
> NETFS_SUPPORT=y)
> +       depends on EROFS_FS
> +       select FSCACHE
>          default n
>          help
>            This permits EROFS to use fscache-backed data blobs with on-demand
> 
> 
> But still the dependency for CACHEFILES_ONDEMAND and CACHEFILES can not
> be resolved.  Though CACHEFILES is not a must during the linking stage
> as EROFS only calls fscache APIs directly, CACHEFILES is indeed needed
> to ensure that the EROFS on-demand functionality works at runtime.
> 
> If we let EROFS_FS_ONDEMAND select CACHEFILES_ONDEMAND, then only
> CACHEFILES_ONDEMAND will be selected while CACHEFILES can be still N.
> Maybe EROFS_FS_ONDEMAND needs to selct both CACHEFILES_ONDEMAND and
> CACHEFILES?

I think the main point here is that we don't have an explicit
menuconfig item for either netfs or fscache directly.

In principle, EROFS ondemand feature only needs fscache "volume
and cookie" management framework as well as cachefiles since
they're all needed to manage EROFS cached blobs, but I'm fine
if that needs NETFS_SUPPORT is also enabled.

If netfs doesn't have a plan for a new explicit menuconfig
item for users to use, I think we have to enable as below:

diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
index 1d318f85232d..fffd3919343e 100644
--- a/fs/erofs/Kconfig
+++ b/fs/erofs/Kconfig
@@ -114,8 +114,11 @@ config EROFS_FS_ZIP_DEFLATE

  config EROFS_FS_ONDEMAND
  	bool "EROFS fscache-based on-demand read support"
-	depends on CACHEFILES_ONDEMAND && (EROFS_FS=m && FSCACHE || EROFS_FS=y && FSCACHE=y)
-	default n
+	depends on EROFS_FS
+	select NETFS_SUPPORT
+	select FSCACHE
+	select CACHEFILES
+	select CACHEFILES_ONDEMAND
  	help
  	  This permits EROFS to use fscache-backed data blobs with on-demand
  	  read support.
--
2.39.3

But cachefiles won't be complied as modules anymore. Does it
sounds good?

Thanks,
Gao Xiang

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


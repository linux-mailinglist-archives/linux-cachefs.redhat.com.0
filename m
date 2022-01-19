Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B37849351A
	for <lists+linux-cachefs@lfdr.de>; Wed, 19 Jan 2022 07:41:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-QkSwNQFeOyaJuwOG5-ujmw-1; Wed, 19 Jan 2022 01:41:20 -0500
X-MC-Unique: QkSwNQFeOyaJuwOG5-ujmw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 124761898290;
	Wed, 19 Jan 2022 06:41:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C85685F90D;
	Wed, 19 Jan 2022 06:41:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F2C611809CB8;
	Wed, 19 Jan 2022 06:41:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20J6fCB8005049 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 01:41:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82EC153C9; Wed, 19 Jan 2022 06:41:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F23C76C4
	for <linux-cachefs@redhat.com>; Wed, 19 Jan 2022 06:41:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 994341044560
	for <linux-cachefs@redhat.com>; Wed, 19 Jan 2022 06:41:09 +0000 (UTC)
Received: from out30-45.freemail.mail.aliyun.com
	(out30-45.freemail.mail.aliyun.com [115.124.30.45]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-93-ZolSl9g1OnWftfu0BYAK9A-1; Wed, 19 Jan 2022 01:41:06 -0500
X-MC-Unique: ZolSl9g1OnWftfu0BYAK9A-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R911e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=15; SR=0;
	TI=SMTPD_---0V2FvZDV_1642574459
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V2FvZDV_1642574459) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 19 Jan 2022 14:41:01 +0800
Date: Wed, 19 Jan 2022 14:40:59 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <Yeeye2AUZITDsdh8@B-P7TQMD6M-0146.local>
Mail-Followup-To: David Howells <dhowells@redhat.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>, linux-cachefs@redhat.com,
	xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com,
	gerry@linux.alibaba.com, eguan@linux.alibaba.com,
	linux-kernel@vger.kernel.org
MIME-Version: 1.0
In-Reply-To: <20220118131216.85338-1-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: joseph.qi@linux.alibaba.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, chao@kernel.org,
	tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-cachefs@redhat.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, xiang@kernel.org,
	gerry@linux.alibaba.com, linux-erofs@lists.ozlabs.org,
	eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v2 00/20] fscache,
 erofs: fscache-based demand-read semantics
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

On Tue, Jan 18, 2022 at 09:11:56PM +0800, Jeffle Xu wrote:
> changes since v1:
> - rebase to v5.17
> - erofs: In chunk based layout, since the logical file offset has the
>   same remainder over PAGE_SIZE with the corresponding physical address
>   inside the data blob file, the file page cache can be directly
>   transferred to netfs library to contain the data from data blob file.
>   (patch 15) (Gao Xiang)
> - netfs,cachefiles: manage logical/physical offset separately. (patch 2)
>   (It is used by erofs_begin_cache_operation() in patch 15.)
> - cachefiles: introduce a new devnode specificaly for on-demand reading.
>   (patch 6)
> - netfs,fscache,cachefiles: add new CONFIG_* for on-demand reading.
>   (patch 3/5)
> - You could start a quick test by
>   https://github.com/lostjeffle/demand-read-cachefilesd
> - add more background information (mainly introduction to nydus) in the
>   "Background" part of this cover letter
> 
> [Important Issues]
> The following issues still need further discussion. Thanks for your time
> and patience.
> 
> 1. I noticed that there's refactoring of netfs library[1], and patch 1
> is not needed since [2].
> 
> 2. The current implementation will severely conflict with the
> refactoring of netfs library[1][2]. The assumption of 'struct
> netfs_i_context' [2] is that, every file in the upper netfs will
> correspond to only one backing file. While in our scenario, one file in
> erofs can correspond to multiple backing files. That is, the content of
> one file can be divided into multiple chunks, and are distrubuted over
> multiple blob files, i.e. multiple backing files. Currently I have no
> good idea solving this conflic.
>

Would you mind give more hints on this? Personally, I still think fscache
is useful and clean way for image distribution on-demand load use cases
in addition to cache network fs data as a more generic in-kernel caching
framework. From the point view of current codestat, it has slight
modification of netfslib and cachefiles (except for a new daemon):
 fs/netfs/Kconfig         |   8 +
 fs/netfs/read_helper.c   |  65 ++++++--
 include/linux/netfs.h    |  10 ++

 fs/cachefiles/Kconfig    |   8 +
 fs/cachefiles/daemon.c   | 147 ++++++++++++++++-
 fs/cachefiles/internal.h |  23 +++
 fs/cachefiles/io.c       |  82 +++++++++-
 fs/cachefiles/main.c     |  27 ++++
 fs/cachefiles/namei.c    |  60 ++++++-

Besides, I think that cookies can be set according to data mapping
(instead of fixed per file) will benefit the following scenario in
addition to our on-demand load use cases:
  It will benefit file cache data deduplication. What I can see is that
netfslib may have some follow-on development in order to support
encryption and compression. However, I think cache data deduplication
is also potentially useful to minimize cache storage since many local
fses already support reflink. However, I'm not sure if it's a great
idea that cachefile relies on underlayfs abilities for cache deduplication.
So for cache deduplication scenarios, I'm not sure per-file cookie is
still a good idea for us (or alternatively, maintain more complicated
mapping per cookie inside fscache besides filesystem mapping, too
unnecessary IMO).
  
By the way, in general, I'm not sure if it's a great idea to cache in
per-file basis (especially for too many small files), that is why we
introduced data deduplicated blobs. At least, it's simpler for read-only
fses. Recently, I found another good article to summarize this:
http://0pointer.net/blog/casync-a-tool-for-distributing-file-system-images.html

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


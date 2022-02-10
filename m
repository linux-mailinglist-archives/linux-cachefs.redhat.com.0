Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D514B05F3
	for <lists+linux-cachefs@lfdr.de>; Thu, 10 Feb 2022 06:58:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-dFTrTeuCOBalv0Autkapdw-1; Thu, 10 Feb 2022 00:58:41 -0500
X-MC-Unique: dFTrTeuCOBalv0Autkapdw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA05F84DA44;
	Thu, 10 Feb 2022 05:58:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 518E0519C9;
	Thu, 10 Feb 2022 05:58:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DD3284BB7C;
	Thu, 10 Feb 2022 05:58:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21A5wTJe022102 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 10 Feb 2022 00:58:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 06E8D2166B1B; Thu, 10 Feb 2022 05:58:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02E812166B25
	for <linux-cachefs@redhat.com>; Thu, 10 Feb 2022 05:58:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1361E2A5954C
	for <linux-cachefs@redhat.com>; Thu, 10 Feb 2022 05:58:26 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-609-cvQWbT8uOY-uC_45UeiKIw-1; Thu, 10 Feb 2022 00:58:21 -0500
X-MC-Unique: cvQWbT8uOY-uC_45UeiKIw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=16; SR=0;
	TI=SMTPD_---0V42eJYQ_1644472693
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V42eJYQ_1644472693) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 10 Feb 2022 13:58:15 +0800
Date: Thu, 10 Feb 2022 13:58:13 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <YgSpdW1LjK2901ix@B-P7TQMD6M-0146.local>
Mail-Followup-To: David Howells <dhowells@redhat.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>, linux-cachefs@redhat.com,
	xiang@kernel.org, chao@kernel.org, linux-erofs@lists.ozlabs.org,
	gregkh@linuxfoundation.org, tao.peng@linux.alibaba.com,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, eguan@linux.alibaba.com,
	gerry@linux.alibaba.com, torvalds@linux-foundation.org
References: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220209060108.43051-1-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: gregkh@linuxfoundation.org, chao@kernel.org, tao.peng@linux.alibaba.com,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, torvalds@linux-foundation.org,
	linux-fsdevel@vger.kernel.org, xiang@kernel.org,
	gerry@linux.alibaba.com, linux-erofs@lists.ozlabs.org,
	eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v3 00/22] fscache,
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

On Wed, Feb 09, 2022 at 02:00:46PM +0800, Jeffle Xu wrote:

...

> 
> 
> Jeffle Xu (22):
>   fscache: export fscache_end_operation()
>   fscache: add a method to support on-demand read semantics
>   cachefiles: extract generic function for daemon methods
>   cachefiles: detect backing file size in on-demand read mode
>   cachefiles: introduce new devnode for on-demand read mode

...

> 
>  Documentation/filesystems/netfs_library.rst |  18 +
>  fs/cachefiles/Kconfig                       |  13 +
>  fs/cachefiles/daemon.c                      | 243 +++++++++--
>  fs/cachefiles/internal.h                    |  12 +
>  fs/cachefiles/io.c                          |  60 +++
>  fs/cachefiles/main.c                        |  27 ++
>  fs/cachefiles/namei.c                       |  60 ++-

Would you mind taking a review at this version? We follow your previous
advices written in v2 and it reuses almost all cachefiles code except
that it has slightly different implication of cachefile file size and
a new daemon node.

I think it could be as the first step to implement fscache-based
on-demand read.

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EDD48D736
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 Jan 2022 13:09:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-fV6jZXgYP5elQyouEkia5w-1; Thu, 13 Jan 2022 07:09:42 -0500
X-MC-Unique: fV6jZXgYP5elQyouEkia5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A095881EE61;
	Thu, 13 Jan 2022 12:09:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B76D6105C72A;
	Thu, 13 Jan 2022 12:09:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 295B54BB7B;
	Thu, 13 Jan 2022 12:09:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20DC9RFl007597 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 Jan 2022 07:09:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 049364047285; Thu, 13 Jan 2022 12:09:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00CD44047272
	for <linux-cachefs@redhat.com>; Thu, 13 Jan 2022 12:09:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCAF22B76048
	for <linux-cachefs@redhat.com>; Thu, 13 Jan 2022 12:09:26 +0000 (UTC)
Received: from out30-130.freemail.mail.aliyun.com
	(out30-130.freemail.mail.aliyun.com [115.124.30.130]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-199-1noa6DFAMs2--Tt42LWwYg-1; Thu, 13 Jan 2022 07:09:22 -0500
X-MC-Unique: 1noa6DFAMs2--Tt42LWwYg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V1jRj.0_1642075754
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V1jRj.0_1642075754) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 13 Jan 2022 20:09:15 +0800
Date: Thu, 13 Jan 2022 20:09:13 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <YeAWaRLdw8hTujLX@B-P7TQMD6M-0146.local>
Mail-Followup-To: JeffleXu <jefflexu@linux.alibaba.com>,
	David Howells <dhowells@redhat.com>, tao.peng@linux.alibaba.com,
	linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com,
	linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
	linux-erofs@lists.ozlabs.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-6-jefflexu@linux.alibaba.com>
	<9eafb56b-809c-c340-5627-a54a6265122b@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <9eafb56b-809c-c340-5627-a54a6265122b@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	joseph.qi@linux.alibaba.com, linux-cachefs@redhat.com,
	bo.liu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
	eguan@linux.alibaba.com, gerry@linux.alibaba.com,
	linux-erofs@lists.ozlabs.org, xiang@kernel.org
Subject: Re: [Linux-cachefs] [PATCH v1 05/23] netfs: add inode parameter to
 netfs_alloc_read_request()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 13, 2022 at 11:10:57AM +0800, JeffleXu wrote:
> Hi David,
> 
> What would you think about this cleanup? We need this in prep for the
> following fscache-based on-demand reading feature. It would be great if
> it could be cherry picked in advance.
> 
> I also simplify the commit message as suggested by Gao Xiang. I could
> resend a v2 patch with the updated commit message if you'd like.
> 
>     netfs: add inode parameter to netfs_alloc_read_request()
> 
>     Make the @file parameter optional, and derive inode from the @folio
>     parameter instead.
> 
>     @file parameter can't be removed completely, since it also works as
>     the private data of ops->init_rreq().
> 
>     Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Hi,

IMHO, How about the following message:

netfs: make @file optional in netfs_alloc_read_request()

Make the @file parameter optional, and derive inode from the @folio
parameter instead in order to support file system internal requests.

@file parameter can't be removed completely, since it also works as
the private data of ops->init_rreq().

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


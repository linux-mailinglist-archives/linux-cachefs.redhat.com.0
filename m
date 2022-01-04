Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5A9484372
	for <lists+linux-cachefs@lfdr.de>; Tue,  4 Jan 2022 15:34:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-ChUTF21nPl-J_XLQLRFA9Q-1; Tue, 04 Jan 2022 09:34:14 -0500
X-MC-Unique: ChUTF21nPl-J_XLQLRFA9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEEAC8015CD;
	Tue,  4 Jan 2022 14:34:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46134752DE;
	Tue,  4 Jan 2022 14:34:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 719614A7C8;
	Tue,  4 Jan 2022 14:34:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 204EY1go023967 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 4 Jan 2022 09:34:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB9472026976; Tue,  4 Jan 2022 14:34:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E61322026612
	for <linux-cachefs@redhat.com>; Tue,  4 Jan 2022 14:33:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F14D880A0AF
	for <linux-cachefs@redhat.com>; Tue,  4 Jan 2022 14:33:55 +0000 (UTC)
Received: from out30-133.freemail.mail.aliyun.com
	(out30-133.freemail.mail.aliyun.com [115.124.30.133]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-630-bPizhjo4O2Crji4GxwmelA-1; Tue, 04 Jan 2022 09:33:35 -0500
X-MC-Unique: bPizhjo4O2Crji4GxwmelA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
	MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
	TI=SMTPD_---0V0xwPNn_1641306806
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
	fp:SMTPD_---0V0xwPNn_1641306806) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 04 Jan 2022 22:33:28 +0800
Date: Tue, 4 Jan 2022 22:33:26 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YdRattisu+ITYvvZ@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
	dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
	chao@kernel.org, linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org, joseph.qi@linux.alibaba.com,
	bo.liu@linux.alibaba.com, tao.peng@linux.alibaba.com,
	gerry@linux.alibaba.com, eguan@linux.alibaba.com,
	linux-kernel@vger.kernel.org
References: <20211227125444.21187-1-jefflexu@linux.alibaba.com>
	<20211227125444.21187-8-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20211227125444.21187-8-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: chao@kernel.org, tao.peng@linux.alibaba.com, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, xiang@kernel.org,
	gerry@linux.alibaba.com, linux-erofs@lists.ozlabs.org,
	eguan@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 07/23] erofs: add nodev mode
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

On Mon, Dec 27, 2021 at 08:54:28PM +0800, Jeffle Xu wrote:
> Until then erofs is exactly blockdev based filesystem. In other using
> scenarios (e.g. container image), erofs needs to run upon files.
> 
> This patch introduces a new nodev mode, in which erofs could be mounted
> from a bootstrap blob file containing the complete erofs image.
> 
> The following patch will introduce a new mount option "uuid", by which
> users could specify the bootstrap blob file.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

I think the order of some patches in this patchset can be improved.

Take this patch as an example. This patch introduces a new mount
option called "uuid", so the kernel will just accept it (which
generates a user-visible impact) after this patch but it doesn't
actually work.

Therefore, we actually have three different behaviors here:
 - kernel doesn't support "uuid" mount option completely;
 - kernel support "uuid" but it doesn't work;
 - kernel support "uuid" correctly (maybe after some random patch);

Actually that is bad for bisecting since there are some commits
having temporary behaviors. And we don't know which commit
actually fully implements this "uuid" mount option.

So personally I think the proper order is just like the bottom-up
approach, and make sure each patch can be tested / bisected
independently.

> ---
>  fs/erofs/data.c     | 13 ++++++++---
>  fs/erofs/internal.h |  1 +
>  fs/erofs/super.c    | 56 +++++++++++++++++++++++++++++++++------------
>  3 files changed, 53 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index 477aaff0c832..61fa431d0713 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -11,11 +11,18 @@
>  
>  struct page *erofs_get_meta_page(struct super_block *sb, erofs_blk_t blkaddr)
>  {
> -	struct address_space *const mapping = sb->s_bdev->bd_inode->i_mapping;
> +	struct address_space *mapping;
>  	struct page *page;
>  
> -	page = read_cache_page_gfp(mapping, blkaddr,
> -				   mapping_gfp_constraint(mapping, ~__GFP_FS));

Apart from the recommendation above, if my understanding is
correct, I think after we implement fscache_aops, 
read_cache_page_gfp() can work with proper fscache mapping.

So no need to implement something like erofs_readpage_from_fscache()
later (at least for the case here.)

Thanks,
Gao Xiang

> +	if (sb->s_bdev) {
> +		mapping = sb->s_bdev->bd_inode->i_mapping;
> +		page = read_cache_page_gfp(mapping, blkaddr,
> +				mapping_gfp_constraint(mapping, ~__GFP_FS));
> +	} else {
> +		/* TODO: data path in nodev mode */
> +		page = ERR_PTR(-EINVAL);
> +	}
> +

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


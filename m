Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E62F84E91BD
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 11:48:49 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-zS_meJWYMS-IFcNiZNUPUQ-1; Mon, 28 Mar 2022 05:48:45 -0400
X-MC-Unique: zS_meJWYMS-IFcNiZNUPUQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE8B99219B4;
	Mon, 28 Mar 2022 09:48:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7630D401E48;
	Mon, 28 Mar 2022 09:48:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F23C91949762;
	Mon, 28 Mar 2022 09:48:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E12E51947BBD for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 28 Mar 2022 09:48:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A7747401E6F; Mon, 28 Mar 2022 09:48:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A31FB401E94
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 09:48:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87FC93C14852
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 09:48:41 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-mmVZGaBPNImsNqngPf8Pdg-1; Mon, 28 Mar 2022 05:48:34 -0400
X-MC-Unique: mmVZGaBPNImsNqngPf8Pdg-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V8QUoPW_1648460907
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V8QUoPW_1648460907) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 28 Mar 2022 17:48:29 +0800
Date: Mon, 28 Mar 2022 17:48:26 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YkGEasaBSCwfGdj3@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
 dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com,
 fannaihao@baidu.com
References: <20220325122223.102958-1-jefflexu@linux.alibaba.com>
 <20220325122223.102958-20-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220325122223.102958-20-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v6 19/22] erofs: register cookie context
 for data blobs
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: tianzichen@kuaishou.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, joseph.qi@linux.alibaba.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 25, 2022 at 08:22:20PM +0800, Jeffle Xu wrote:
> Similar to the multi device mode, erofs could be mounted from multiple
> blob files (one bootstrap blob file and optional multiple data blob
> files). In this case, each device slot contains the path of
> corresponding data blob file.
> 
> Registers corresponding cookie context for each data blob file.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/internal.h |  1 +
>  fs/erofs/super.c    | 30 ++++++++++++++++++++++--------
>  2 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 6537ededed51..94a118caf580 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -52,6 +52,7 @@ struct erofs_device_info {
>  	struct block_device *bdev;
>  	struct dax_device *dax_dev;

Place
	struct erofs_fscache *fscache;

>  	u64 dax_part_off;
> +	struct erofs_fscache *blob;

Instead here since `blob' is also nydus-specific.

Need to update the subject and commit message too.

>  
>  	u32 blocks;
>  	u32 mapped_blkaddr;
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index de5aeda4aea0..9a6f35e0c22b 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -259,15 +259,28 @@ static int erofs_init_devices(struct super_block *sb,
>  		}
>  		dis = ptr + erofs_blkoff(pos);
>  
> -		bdev = blkdev_get_by_path(dif->path,
> -					  FMODE_READ | FMODE_EXCL,
> -					  sb->s_type);
> -		if (IS_ERR(bdev)) {
> -			err = PTR_ERR(bdev);
> -			break;
> +		if (IS_ENABLED(CONFIG_EROFS_FS_ONDEMAND) &&
> +		    erofs_is_nodev_mode(sb)) {
> +			struct erofs_fscache *blob;

Same here.

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 991964E91E8
	for <lists+linux-cachefs@lfdr.de>; Mon, 28 Mar 2022 11:51:15 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-12-vzwcF7VdN6anB7I2_AEn3g-1; Mon, 28 Mar 2022 05:51:11 -0400
X-MC-Unique: vzwcF7VdN6anB7I2_AEn3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE23E805F65;
	Mon, 28 Mar 2022 09:51:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C24042026987;
	Mon, 28 Mar 2022 09:51:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76BEA1949762;
	Mon, 28 Mar 2022 09:51:10 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 77E471947BBD for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 28 Mar 2022 09:51:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 527222027EB3; Mon, 28 Mar 2022 09:51:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C466202660D
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 09:51:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2616B899ED2
 for <linux-cachefs@redhat.com>; Mon, 28 Mar 2022 09:51:03 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-OYWC-4TqO-OiAhKfLI3yqQ-1; Mon, 28 Mar 2022 05:51:00 -0400
X-MC-Unique: OYWC-4TqO-OiAhKfLI3yqQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V8QUozc_1648461053
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V8QUozc_1648461053) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 28 Mar 2022 17:50:55 +0800
Date: Mon, 28 Mar 2022 17:50:52 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <YkGE/DtZ3VeddqRL@B-P7TQMD6M-0146.local>
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
 <20220325122223.102958-21-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220325122223.102958-21-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Linux-cachefs] [PATCH v6 20/22] erofs: implement fscache-based
 data read for data blobs
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 25, 2022 at 08:22:21PM +0800, Jeffle Xu wrote:
> Implements the data plane of reading data from data blob file over
> fscache.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/erofs/data.c     |  3 +++
>  fs/erofs/fscache.c  | 15 +++++++++++++--
>  fs/erofs/internal.h |  1 +
>  3 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index b4571bea93d5..b9a05de3c3b2 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -206,6 +206,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
>  	map->m_bdev = sb->s_bdev;
>  	map->m_daxdev = EROFS_SB(sb)->dax_dev;
>  	map->m_dax_part_off = EROFS_SB(sb)->dax_part_off;
> +	map->m_fscache = EROFS_SB(sb)->bootstrap;
>  
>  	if (map->m_deviceid) {
>  		down_read(&devs->rwsem);
> @@ -217,6 +218,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
>  		map->m_bdev = dif->bdev;
>  		map->m_daxdev = dif->dax_dev;
>  		map->m_dax_part_off = dif->dax_part_off;
> +		map->m_fscache = dif->blob;
>  		up_read(&devs->rwsem);
>  	} else if (devs->extra_devices) {
>  		down_read(&devs->rwsem);
> @@ -234,6 +236,7 @@ int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *map)
>  				map->m_bdev = dif->bdev;
>  				map->m_daxdev = dif->dax_dev;
>  				map->m_dax_part_off = dif->dax_part_off;
> +				map->m_fscache = dif->blob;
>  				break;
>  			}
>  		}
> diff --git a/fs/erofs/fscache.c b/fs/erofs/fscache.c
> index d75958470645..cbb39657615e 100644
> --- a/fs/erofs/fscache.c
> +++ b/fs/erofs/fscache.c
> @@ -63,9 +63,20 @@ static int erofs_fscache_readpage_blob(struct file *data, struct page *page)
>  static inline int erofs_fscache_get_map(struct erofs_map_blocks *map,
>  					struct super_block *sb)
>  {

So erofs_fscache_get_map seems really unneeded...
erofs_map_dev can be used directly so we can avoid this patch.

Thanks,
Gao Xiang

> -	struct erofs_sb_info *sbi = EROFS_SB(sb);
> +	struct erofs_map_dev mdev;
> +	int ret;
> +
> +	mdev = (struct erofs_map_dev) {
> +		.m_deviceid = map->m_deviceid,
> +		.m_pa = map->m_pa,
> +	};
> +
> +	ret = erofs_map_dev(sb, &mdev);
> +	if (ret)
> +		return ret;
>  
> -	map->m_fscache	= sbi->bootstrap;
> +	map->m_fscache	= mdev.m_fscache;
> +	map->m_pa	= mdev.m_pa;
>  	return 0;
>  }
>  
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 94a118caf580..cea08f12a2c3 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -487,6 +487,7 @@ struct erofs_map_dev {
>  	struct block_device *m_bdev;
>  	struct dax_device *m_daxdev;
>  	u64 m_dax_part_off;
> +	struct erofs_fscache *m_fscache;
>  
>  	erofs_off_t m_pa;
>  	unsigned int m_deviceid;
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


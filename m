Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC64F7238
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 04:45:13 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-KkU6RN5qMEmsh6vEdnrQMA-1; Wed, 06 Apr 2022 22:45:09 -0400
X-MC-Unique: KkU6RN5qMEmsh6vEdnrQMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2643F8038E3;
	Thu,  7 Apr 2022 02:45:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9A7F940CF918;
	Thu,  7 Apr 2022 02:45:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 32494194036B;
	Thu,  7 Apr 2022 02:45:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 52555194034B for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 02:45:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3272E482CE0; Thu,  7 Apr 2022 02:45:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E316428F04
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 02:45:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16AF9185A7B2
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 02:45:04 +0000 (UTC)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-deHaUWnaMoeYnlNeZD8J8w-1; Wed, 06 Apr 2022 22:44:57 -0400
X-MC-Unique: deHaUWnaMoeYnlNeZD8J8w-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=19; SR=0; TI=SMTPD_---0V9O8VBd_1649299490
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0V9O8VBd_1649299490) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 07 Apr 2022 10:44:52 +0800
Date: Thu, 7 Apr 2022 10:44:50 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>
Message-ID: <Yk5QIsUKie+dI8KR@B-P7TQMD6M-0146.local>
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
References: <20220406075612.60298-1-jefflexu@linux.alibaba.com>
 <20220406075612.60298-9-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220406075612.60298-9-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v8 08/20] erofs: make erofs_map_blocks()
 generally available
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 06, 2022 at 03:56:00PM +0800, Jeffle Xu wrote:
> ... so that it can be used in the following introduced fscache mode.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Thanks,
Gao Xiang

> ---
>  fs/erofs/data.c     | 4 ++--
>  fs/erofs/internal.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index 780db1e5f4b7..bc22642358ec 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -110,8 +110,8 @@ static int erofs_map_blocks_flatmode(struct inode *inode,
>  	return 0;
>  }
>  
> -static int erofs_map_blocks(struct inode *inode,
> -			    struct erofs_map_blocks *map, int flags)
> +int erofs_map_blocks(struct inode *inode,
> +		     struct erofs_map_blocks *map, int flags)
>  {
>  	struct super_block *sb = inode->i_sb;
>  	struct erofs_inode *vi = EROFS_I(inode);
> diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
> index 5298c4ee277d..fe9564e5091e 100644
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -486,6 +486,8 @@ void *erofs_read_metabuf(struct erofs_buf *buf, struct super_block *sb,
>  int erofs_map_dev(struct super_block *sb, struct erofs_map_dev *dev);
>  int erofs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>  		 u64 start, u64 len);
> +int erofs_map_blocks(struct inode *inode,
> +		     struct erofs_map_blocks *map, int flags);
>  
>  /* inode.c */
>  static inline unsigned long erofs_inode_hash(erofs_nid_t nid)
> -- 
> 2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


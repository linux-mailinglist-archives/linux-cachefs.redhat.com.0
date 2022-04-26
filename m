Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B53E50FDBE
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Apr 2022 14:54:45 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-XVjQbPDpOhy1DR6gN1WF9A-1; Tue, 26 Apr 2022 08:54:42 -0400
X-MC-Unique: XVjQbPDpOhy1DR6gN1WF9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 381CC185A794;
	Tue, 26 Apr 2022 12:54:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E454114152E5;
	Tue, 26 Apr 2022 12:54:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 45A9D1949762;
	Tue, 26 Apr 2022 12:54:38 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1600C1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 26 Apr 2022 12:54:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 018E4404776F; Tue, 26 Apr 2022 12:54:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1F0540470ED
 for <linux-cachefs@redhat.com>; Tue, 26 Apr 2022 12:54:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA90F800882
 for <linux-cachefs@redhat.com>; Tue, 26 Apr 2022 12:54:36 +0000 (UTC)
Received: from out199-17.us.a.mail.aliyun.com
 (out199-17.us.a.mail.aliyun.com [47.90.199.17]) by relay.mimecast.com with
 ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-NcT33a5iOy-S62nTcQugmQ-1; Tue, 26 Apr 2022 08:54:32 -0400
X-MC-Unique: NcT33a5iOy-S62nTcQugmQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=hsiangkao@linux.alibaba.com;
 NM=1; PH=DS; RN=21; SR=0; TI=SMTPD_---0VBMUIgL_1650977664
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VBMUIgL_1650977664) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 26 Apr 2022 20:54:27 +0800
Date: Tue, 26 Apr 2022 20:54:24 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com
Message-ID: <YmfrgPkloTAgYe4Z@B-P7TQMD6M-0146.local>
Mail-Followup-To: Jeffle Xu <jefflexu@linux.alibaba.com>,
 dhowells@redhat.com, linux-cachefs@redhat.com, xiang@kernel.org,
 chao@kernel.org, linux-erofs@lists.ozlabs.org,
 torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
 willy@infradead.org, linux-fsdevel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 tao.peng@linux.alibaba.com, gerry@linux.alibaba.com,
 eguan@linux.alibaba.com, linux-kernel@vger.kernel.org,
 luodaowen.backend@bytedance.com, tianzichen@kuaishou.com,
 fannaihao@baidu.com, zhangjiachen.jaycee@bytedance.com,
 zhujia.zj@bytedance.com
References: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220425122143.56815-1-jefflexu@linux.alibaba.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH v10 00/21] fscache,
 erofs: fscache-based on-demand read semantics
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
Cc: zhujia.zj@bytedance.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, zhangjiachen.jaycee@bytedance.com,
 linux-cachefs@redhat.com, bo.liu@linux.alibaba.com, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 xiang@kernel.org, gerry@linux.alibaba.com, torvalds@linux-foundation.org,
 eguan@linux.alibaba.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 25, 2022 at 08:21:22PM +0800, Jeffle Xu wrote:
> changes since v9:
> - rebase to 5.18-rc3
> - cachefiles: extract cachefiles_in_ondemand_mode() helper; add barrier
>   pair between enqueuing and flushing requests; make the xarray
>   structures non-conditionally defined in struct cachefiles_cache
>   (patch 2) (David Howells)
> - cacehfiles: use refcount_t for unbind_pincount; run "cachefiles_open = 0;"
>   cleanup only when unbind_pincount is decreased to 0 (patch 3)
>   (David Howells)
> - cachefiles: rename CACHEFILES_IOC_CREAD ioctl to
>   CACHEFILES_IOC_READ_COMPLETE (patch 5) (David Howells)
> - cachefiles: fix the error message when the argument to the 'bind'
>   command is invalid (patch 6) (David Howells)
> - cachefiles: update the documentation polished by David (patch 8)
> - erofs: tweak the code arrangement of erofs_fscache_meta_readpage()
>   (patch 17) (Gao Xiang)
> - erofs: add comment on error cases (patch 20) (Gao Xiang)
> - update Tested-by tags in the cover letter
> 
> 
> Kernel Patchset
> ---------------
> Git tree:
> 
>     https://github.com/lostjeffle/linux.git jingbo/dev-erofs-fscache-v10
> 

Come to an agreement with David on IRC, I will push out this series to
-next later for wider testing aiming for 5.19.

Thanks,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


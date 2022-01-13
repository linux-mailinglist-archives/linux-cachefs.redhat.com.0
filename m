Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CB048D44D
	for <lists+linux-cachefs@lfdr.de>; Thu, 13 Jan 2022 10:15:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-zNMxegc-MDCxuQDIRuAmYA-1; Thu, 13 Jan 2022 04:15:27 -0500
X-MC-Unique: zNMxegc-MDCxuQDIRuAmYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5764100C668;
	Thu, 13 Jan 2022 09:15:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FFC779591;
	Thu, 13 Jan 2022 09:15:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE173181844A;
	Thu, 13 Jan 2022 09:15:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20D9BgLR027945 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 13 Jan 2022 04:11:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5073753DC; Thu, 13 Jan 2022 09:11:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B40053DB
	for <linux-cachefs@redhat.com>; Thu, 13 Jan 2022 09:11:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A966823F6F
	for <linux-cachefs@redhat.com>; Thu, 13 Jan 2022 09:11:39 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
	(out30-54.freemail.mail.aliyun.com [115.124.30.54]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-125-aRWPtsDgP1SCyjz19F2xHQ-1; Thu, 13 Jan 2022 04:11:37 -0500
X-MC-Unique: aRWPtsDgP1SCyjz19F2xHQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0V1jPsaR_1642065092
Received: from 30.225.24.62(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0V1jPsaR_1642065092) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 13 Jan 2022 17:11:33 +0800
Message-ID: <b3982eb6-a8a9-a5f7-be93-a4fca68f25f1@linux.alibaba.com>
Date: Thu, 13 Jan 2022 17:11:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.3.2
To: David Howells <dhowells@redhat.com>
References: <20211228124419.103020-1-jefflexu@linux.alibaba.com>
	<1483070.1642062179@warthog.procyon.org.uk>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <1483070.1642062179@warthog.procyon.org.uk>
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
Cc: idryomov@gmail.com, linux-cachefs@redhat.com, jlayton@kernel.org,
	ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: Make ops->init_rreq() optional
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 1/13/22 4:22 PM, David Howells wrote:
> Hi Jeffle,
> 
> I've altered your patch commit message, if you could take a look?
> 
> David
> ---
> From: Jeffle Xu <jefflexu@linux.alibaba.com>
> 
> netfs: Make ops->init_rreq() optional
> 
> Make the ops->init_rreq() callback optional.  This isn't required for the
> erofs changes I'm implementing to do on-demand read through fscache[1].
> Further, ceph has an empty init_rreq method that can then be removed and
> it's marked optional in the documentation.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
> Link: https://lore.kernel.org/r/20211227125444.21187-1-jefflexu@linux.alibaba.com/ [1]
> Link: https://lore.kernel.org/r/20211228124419.103020-1-jefflexu@linux.alibaba.com
> ---

LGTM. Thanks.


>  fs/ceph/addr.c         |    5 -----
>  fs/netfs/read_helper.c |    3 ++-
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index b3d9459c9bbd..c98e5238a1b6 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -297,10 +297,6 @@ static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
>  	dout("%s: result %d\n", __func__, err);
>  }
>  
> -static void ceph_init_rreq(struct netfs_read_request *rreq, struct file *file)
> -{
> -}
> -
>  static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>  {
>  	struct inode *inode = mapping->host;
> @@ -312,7 +308,6 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>  }
>  
>  static const struct netfs_read_request_ops ceph_netfs_read_ops = {
> -	.init_rreq		= ceph_init_rreq,
>  	.is_cache_enabled	= ceph_is_cache_enabled,
>  	.begin_cache_operation	= ceph_begin_cache_operation,
>  	.issue_op		= ceph_netfs_issue_op,
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index 6169659857b3..501da990c259 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -55,7 +55,8 @@ static struct netfs_read_request *netfs_alloc_read_request(
>  		INIT_WORK(&rreq->work, netfs_rreq_work);
>  		refcount_set(&rreq->usage, 1);
>  		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
> -		ops->init_rreq(rreq, file);
> +		if (ops->init_rreq)
> +			ops->init_rreq(rreq, file);
>  		netfs_stat(&netfs_n_rh_rreq);
>  	}
>  
> 

-- 
Thanks,
Jeffle

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


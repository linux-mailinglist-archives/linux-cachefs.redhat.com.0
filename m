Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F081486CB2
	for <lists+linux-cachefs@lfdr.de>; Thu,  6 Jan 2022 22:49:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-W9O96B2SMmmu-U3ATNioTg-1; Thu, 06 Jan 2022 16:49:44 -0500
X-MC-Unique: W9O96B2SMmmu-U3ATNioTg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22E391083F60;
	Thu,  6 Jan 2022 21:49:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2F0678D87;
	Thu,  6 Jan 2022 21:49:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC70B4BB7C;
	Thu,  6 Jan 2022 21:49:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206Lncb1027854 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 16:49:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 05CE32026614; Thu,  6 Jan 2022 21:49:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 013A42026D6B
	for <linux-cachefs@redhat.com>; Thu,  6 Jan 2022 21:49:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19C8480029D
	for <linux-cachefs@redhat.com>; Thu,  6 Jan 2022 21:49:35 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-340-sACJIapwO9G4MkXW3A7q7g-1; Thu, 06 Jan 2022 16:49:31 -0500
X-MC-Unique: sACJIapwO9G4MkXW3A7q7g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 42EFBB8244D;
	Thu,  6 Jan 2022 21:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660ECC36AE3;
	Thu,  6 Jan 2022 21:49:28 +0000 (UTC)
Message-ID: <693ab77bab10b38b1ddab373211c24722e79fee2.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, idryomov@gmail.com,
	ceph-devel@vger.kernel.org, dhowells@redhat.com, linux-cachefs@redhat.com
Date: Thu, 06 Jan 2022 16:49:27 -0500
In-Reply-To: <20211228124419.103020-1-jefflexu@linux.alibaba.com>
References: <20211228124419.103020-1-jefflexu@linux.alibaba.com>
User-Agent: Evolution 3.42.2 (3.42.2-1.fc35)
MIME-Version: 1.0
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
Subject: Re: [Linux-cachefs] [PATCH] netfs: make ops->init_rreq() optional
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2021-12-28 at 20:44 +0800, Jeffle Xu wrote:
> Hi, recently I'm developing erofs over fscache for implementing
> on-demand read, and erofs also implements an empty .init_rreq()
> callback[1].
> 
> [1] https://lkml.org/lkml/2021/12/27/224
> 
> If folks don't like this cleanup and prefer empty callback in upper fs,
> I'm also fine with that.
> ---
> There's already upper fs implementing empty .init_rreq() callback, and
> thus make it optional.
> 
> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
> ---
>  fs/ceph/addr.c         | 5 -----
>  fs/netfs/read_helper.c | 3 ++-
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index e53c8541f5b2..c3537dfd8c04 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -291,10 +291,6 @@ static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
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
> @@ -306,7 +302,6 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>  }
>  
>  static const struct netfs_read_request_ops ceph_netfs_read_ops = {
> -	.init_rreq		= ceph_init_rreq,
>  	.is_cache_enabled	= ceph_is_cache_enabled,
>  	.begin_cache_operation	= ceph_begin_cache_operation,
>  	.issue_op		= ceph_netfs_issue_op,
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index 75c76cbb27cc..0befb0747c59 100644
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

This looks reasonable to me, since ceph doesn't need anything here
anyway.

Reviewed-by: Jeff Layton <jlayton@kernel.org>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BDB4D323B
	for <lists+linux-cachefs@lfdr.de>; Wed,  9 Mar 2022 16:54:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646841256;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EVohSV5oS7Xr49nUwUgxljEsNkd70Noky/uDKMfbp9E=;
	b=LNiHXLhXCJbMKU9C7e9Y5M5T0pDISGpc2dsqBNk/wXiOjlf9KrTkumXi+ovPb22SrX0aPP
	w008F2hp9cTmv0H8GNp09AXy0JnXvC4M4AqXfUlGaxFB0Rokn+XRmtgkoZPkYFafujjeJn
	wdE7vszowYrJ9HyUOS4RYshYQHualBA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-GJ31GUMYNPaagG1Ask0mFA-1; Wed, 09 Mar 2022 10:54:15 -0500
X-MC-Unique: GJ31GUMYNPaagG1Ask0mFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FA3C8339C3;
	Wed,  9 Mar 2022 15:54:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C91B40FF708;
	Wed,  9 Mar 2022 15:54:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5361B195354D;
	Wed,  9 Mar 2022 15:54:11 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EACAB1953540 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  9 Mar 2022 15:44:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 99E55140EBD5; Wed,  9 Mar 2022 15:44:25 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 964E5141DC28
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 15:44:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C7C71C05EAA
 for <linux-cachefs@redhat.com>; Wed,  9 Mar 2022 15:44:25 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-_h4OxTK9P5am3E82ZryOJA-1; Wed, 09 Mar 2022 10:44:24 -0500
X-MC-Unique: _h4OxTK9P5am3E82ZryOJA-1
Received: by mail-qk1-f199.google.com with SMTP id
 i2-20020a05620a248200b0067b51fa1269so1779122qkn.19
 for <linux-cachefs@redhat.com>; Wed, 09 Mar 2022 07:44:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=EPv2czUPN4P3J0p1kuWcwN5wFtTDrdP4nhrIIWXDX5M=;
 b=MOWg0SspgB6Sxx83HseZFNopdvFlPcVz/dXofEe5/ui9EeDDHqe679i8YoPNJNWV07
 06TG7mU16/5O0SWHstHiCQp3hsz/eNidMxLSjki4lNjR9xMLlfi5uu9oHnWLQaqNBJe6
 WcTP+vzVtFfN86L1fAOe3BjVvF6MOVuwXdSK6frjvwYjHH7e4vuFEOpjJ2S8T6hKZtH/
 JoDlXzrSminMUdBP9C580w2zk2sPHSZh74plNsaFmmFVN2JH6x+bXxcacwQLdo/EN6l+
 bzcrPgnXvhBFYb2oFDuFzjAmIDRUpvK5GLir1+7P+eBS1dLZkKUK1PinDP8KZOi6oIQN
 3sQw==
X-Gm-Message-State: AOAM530/r4JMTFfjugSIfVAaZP4eHRpEPVG846xtRhuTa9oFqSV3g+B6
 9iGWZGIj6hDfKdmYUo/edfruJp6mtNj44FryKCWtkF+kdeZp8Epe+P834G9nL/VsmBsECzkr9YW
 hRPXoP0oMbFeFcxbteaFm7w==
X-Received: by 2002:a05:622a:14c:b0:2e1:a5c5:87ac with SMTP id
 v12-20020a05622a014c00b002e1a5c587acmr247672qtw.246.1646840663739; 
 Wed, 09 Mar 2022 07:44:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJNGuKSaMEHnpv0VBhlvfbOKgbucbJF29mIvY1nAjWMtgIj8s5DzxuGSPOhnzq5jp8Pwx3Hg==
X-Received: by 2002:a05:622a:14c:b0:2e1:a5c5:87ac with SMTP id
 v12-20020a05622a014c00b002e1a5c587acmr247647qtw.246.1646840663386; 
 Wed, 09 Mar 2022 07:44:23 -0800 (PST)
Received: from [192.168.1.3] (68-20-15-154.lightspeed.rlghnc.sbcglobal.net.
 [68.20.15.154]) by smtp.gmail.com with ESMTPSA id
 m6-20020ae9e006000000b0067d3e75e2a6sm549575qkk.19.2022.03.09.07.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 07:44:23 -0800 (PST)
Message-ID: <b28618df1b6c31f42b75c8f759011444018bbece.camel@redhat.com>
From: Jeff Layton <jlayton@redhat.com>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com
Date: Wed, 09 Mar 2022 10:44:22 -0500
In-Reply-To: <164678197044.1200972.11511937252083343775.stgit@warthog.procyon.org.uk>
References: <164678185692.1200972.597611902374126174.stgit@warthog.procyon.org.uk>
 <164678197044.1200972.11511937252083343775.stgit@warthog.procyon.org.uk>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Linux-cachefs] [PATCH v2 05/19] netfs: Split netfs_io_* object
 handling out
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@netapp.com>, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2022-03-08 at 23:26 +0000, David Howells wrote:
> Split netfs_io_* object handling out into a file that's going to contain
> object allocation, get and put routines.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: linux-cachefs@redhat.com
> 
> Link: https://lore.kernel.org/r/164622995118.3564931.6089530629052064470.stgit@warthog.procyon.org.uk/ # v1
> ---
> 
>  fs/netfs/Makefile      |    6 ++
>  fs/netfs/internal.h    |   18 +++++++
>  fs/netfs/objects.c     |  123 ++++++++++++++++++++++++++++++++++++++++++++++++
>  fs/netfs/read_helper.c |  118 ----------------------------------------------
>  4 files changed, 147 insertions(+), 118 deletions(-)
>  create mode 100644 fs/netfs/objects.c
> 
> diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
> index c15bfc966d96..939fd00a1fc9 100644
> --- a/fs/netfs/Makefile
> +++ b/fs/netfs/Makefile
> @@ -1,5 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -netfs-y := read_helper.o stats.o
> +netfs-y := \
> +	objects.o \
> +	read_helper.o
> +
> +netfs-$(CONFIG_NETFS_STATS) += stats.o
>  
>  obj-$(CONFIG_NETFS_SUPPORT) := netfs.o
> diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
> index b7f2c4459f33..cf7a3ddb16a4 100644
> --- a/fs/netfs/internal.h
> +++ b/fs/netfs/internal.h
> @@ -5,17 +5,35 @@
>   * Written by David Howells (dhowells@redhat.com)
>   */
>  
> +#include <linux/netfs.h>
> +#include <trace/events/netfs.h>
> +
>  #ifdef pr_fmt
>  #undef pr_fmt
>  #endif
>  
>  #define pr_fmt(fmt) "netfs: " fmt
>  
> +/*
> + * objects.c
> + */
> +struct netfs_io_request *netfs_alloc_request(const struct netfs_request_ops *ops,
> +					     void *netfs_priv,
> +					     struct file *file);
> +void netfs_get_request(struct netfs_io_request *rreq);
> +void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async);
> +void netfs_put_request(struct netfs_io_request *rreq, bool was_async);
> +struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq);
> +void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async);
> +void netfs_get_subrequest(struct netfs_io_subrequest *subreq);
> +
>  /*
>   * read_helper.c
>   */
>  extern unsigned int netfs_debug;
>  
> +void netfs_rreq_work(struct work_struct *work);
> +
>  /*
>   * stats.c
>   */
> diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
> new file mode 100644
> index 000000000000..f7383c28dc6e
> --- /dev/null
> +++ b/fs/netfs/objects.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Object lifetime handling and tracing.
> + *
> + * Copyright (C) 2022 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + */
> +
> +#include <linux/slab.h>
> +#include "internal.h"
> +
> +/*
> + * Allocate an I/O request and initialise it.
> + */
> +struct netfs_io_request *netfs_alloc_request(
> +	const struct netfs_request_ops *ops, void *netfs_priv,
> +	struct file *file)
> +{
> +	static atomic_t debug_ids;
> +	struct netfs_io_request *rreq;
> +
> +	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
> +	if (rreq) {
> +		rreq->netfs_ops	= ops;
> +		rreq->netfs_priv = netfs_priv;
> +		rreq->inode	= file_inode(file);
> +		rreq->i_size	= i_size_read(rreq->inode);
> +		rreq->debug_id	= atomic_inc_return(&debug_ids);
> +		INIT_LIST_HEAD(&rreq->subrequests);
> +		INIT_WORK(&rreq->work, netfs_rreq_work);
> +		refcount_set(&rreq->usage, 1);
> +		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
> +		if (ops->init_request)
> +			ops->init_request(rreq, file);
> +		netfs_stat(&netfs_n_rh_rreq);
> +	}
> +
> +	return rreq;
> +}
> +
> +void netfs_get_request(struct netfs_io_request *rreq)
> +{
> +	refcount_inc(&rreq->usage);
> +}
> +
> +void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async)
> +{
> +	struct netfs_io_subrequest *subreq;
> +
> +	while (!list_empty(&rreq->subrequests)) {
> +		subreq = list_first_entry(&rreq->subrequests,
> +					  struct netfs_io_subrequest, rreq_link);
> +		list_del(&subreq->rreq_link);
> +		netfs_put_subrequest(subreq, was_async);
> +	}
> +}
> +
> +static void netfs_free_request(struct work_struct *work)
> +{
> +	struct netfs_io_request *rreq =
> +		container_of(work, struct netfs_io_request, work);
> +	netfs_clear_subrequests(rreq, false);
> +	if (rreq->netfs_priv)
> +		rreq->netfs_ops->cleanup(rreq->mapping, rreq->netfs_priv);
> +	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
> +	if (rreq->cache_resources.ops)
> +		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
> +	kfree(rreq);
> +	netfs_stat_d(&netfs_n_rh_rreq);
> +}
> +
> +void netfs_put_request(struct netfs_io_request *rreq, bool was_async)
> +{
> +	if (refcount_dec_and_test(&rreq->usage)) {
> +		if (was_async) {
> +			rreq->work.func = netfs_free_request;
> +			if (!queue_work(system_unbound_wq, &rreq->work))
> +				BUG();
> +		} else {
> +			netfs_free_request(&rreq->work);
> +		}
> +	}
> +}
> +
> +/*
> + * Allocate and partially initialise an I/O request structure.
> + */
> +struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq)
> +{
> +	struct netfs_io_subrequest *subreq;
> +
> +	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
> +	if (subreq) {
> +		INIT_LIST_HEAD(&subreq->rreq_link);
> +		refcount_set(&subreq->usage, 2);
> +		subreq->rreq = rreq;
> +		netfs_get_request(rreq);
> +		netfs_stat(&netfs_n_rh_sreq);
> +	}
> +
> +	return subreq;
> +}
> +
> +void netfs_get_subrequest(struct netfs_io_subrequest *subreq)
> +{
> +	refcount_inc(&subreq->usage);
> +}
> +
> +static void __netfs_put_subrequest(struct netfs_io_subrequest *subreq,
> +				   bool was_async)
> +{
> +	struct netfs_io_request *rreq = subreq->rreq;
> +
> +	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
> +	kfree(subreq);
> +	netfs_stat_d(&netfs_n_rh_sreq);
> +	netfs_put_request(rreq, was_async);
> +}
> +
> +void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async)
> +{
> +	if (refcount_dec_and_test(&subreq->usage))
> +		__netfs_put_subrequest(subreq, was_async);
> +}
> diff --git a/fs/netfs/read_helper.c b/fs/netfs/read_helper.c
> index 26d54055b17e..ef23ef9889d5 100644
> --- a/fs/netfs/read_helper.c
> +++ b/fs/netfs/read_helper.c
> @@ -27,122 +27,6 @@ unsigned netfs_debug;
>  module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
>  MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
>  
> -static void netfs_rreq_work(struct work_struct *);
> -static void __netfs_put_subrequest(struct netfs_io_subrequest *, bool);
> -
> -static void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
> -				 bool was_async)
> -{
> -	if (refcount_dec_and_test(&subreq->usage))
> -		__netfs_put_subrequest(subreq, was_async);
> -}
> -
> -static struct netfs_io_request *netfs_alloc_request(
> -	const struct netfs_request_ops *ops, void *netfs_priv,
> -	struct file *file)
> -{
> -	static atomic_t debug_ids;
> -	struct netfs_io_request *rreq;
> -
> -	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
> -	if (rreq) {
> -		rreq->netfs_ops	= ops;
> -		rreq->netfs_priv = netfs_priv;
> -		rreq->inode	= file_inode(file);
> -		rreq->i_size	= i_size_read(rreq->inode);
> -		rreq->debug_id	= atomic_inc_return(&debug_ids);
> -		INIT_LIST_HEAD(&rreq->subrequests);
> -		INIT_WORK(&rreq->work, netfs_rreq_work);
> -		refcount_set(&rreq->usage, 1);
> -		__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
> -		if (ops->init_request)
> -			ops->init_request(rreq, file);
> -		netfs_stat(&netfs_n_rh_rreq);
> -	}
> -
> -	return rreq;
> -}
> -
> -static void netfs_get_request(struct netfs_io_request *rreq)
> -{
> -	refcount_inc(&rreq->usage);
> -}
> -
> -static void netfs_clear_subrequests(struct netfs_io_request *rreq, bool was_async)
> -{
> -	struct netfs_io_subrequest *subreq;
> -
> -	while (!list_empty(&rreq->subrequests)) {
> -		subreq = list_first_entry(&rreq->subrequests,
> -					  struct netfs_io_subrequest, rreq_link);
> -		list_del(&subreq->rreq_link);
> -		netfs_put_subrequest(subreq, was_async);
> -	}
> -}
> -
> -static void netfs_free_request(struct work_struct *work)
> -{
> -	struct netfs_io_request *rreq =
> -		container_of(work, struct netfs_io_request, work);
> -	netfs_clear_subrequests(rreq, false);
> -	if (rreq->netfs_priv)
> -		rreq->netfs_ops->cleanup(rreq->mapping, rreq->netfs_priv);
> -	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
> -	if (rreq->cache_resources.ops)
> -		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
> -	kfree(rreq);
> -	netfs_stat_d(&netfs_n_rh_rreq);
> -}
> -
> -static void netfs_put_request(struct netfs_io_request *rreq, bool was_async)
> -{
> -	if (refcount_dec_and_test(&rreq->usage)) {
> -		if (was_async) {
> -			rreq->work.func = netfs_free_request;
> -			if (!queue_work(system_unbound_wq, &rreq->work))
> -				BUG();
> -		} else {
> -			netfs_free_request(&rreq->work);
> -		}
> -	}
> -}
> -
> -/*
> - * Allocate and partially initialise an I/O request structure.
> - */
> -static struct netfs_io_subrequest *netfs_alloc_subrequest(
> -	struct netfs_io_request *rreq)
> -{
> -	struct netfs_io_subrequest *subreq;
> -
> -	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
> -	if (subreq) {
> -		INIT_LIST_HEAD(&subreq->rreq_link);
> -		refcount_set(&subreq->usage, 2);
> -		subreq->rreq = rreq;
> -		netfs_get_request(rreq);
> -		netfs_stat(&netfs_n_rh_sreq);
> -	}
> -
> -	return subreq;
> -}
> -
> -static void netfs_get_subrequest(struct netfs_io_subrequest *subreq)
> -{
> -	refcount_inc(&subreq->usage);
> -}
> -
> -static void __netfs_put_subrequest(struct netfs_io_subrequest *subreq,
> -				   bool was_async)
> -{
> -	struct netfs_io_request *rreq = subreq->rreq;
> -
> -	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
> -	kfree(subreq);
> -	netfs_stat_d(&netfs_n_rh_sreq);
> -	netfs_put_request(rreq, was_async);
> -}
> -
>  /*
>   * Clear the unread part of an I/O request.
>   */
> @@ -558,7 +442,7 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
>  	netfs_rreq_completed(rreq, was_async);
>  }
>  
> -static void netfs_rreq_work(struct work_struct *work)
> +void netfs_rreq_work(struct work_struct *work)
>  {
>  	struct netfs_io_request *rreq =
>  		container_of(work, struct netfs_io_request, work);
> 
> 

Reviewed-by: Jeff Layton <jlayton@redhat.com>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


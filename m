Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E77A631DC93
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 16:41:24 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-rGb1YZqbNcSShAG-7HxYqw-1; Wed, 17 Feb 2021 10:41:20 -0500
X-MC-Unique: rGb1YZqbNcSShAG-7HxYqw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 799A480199E;
	Wed, 17 Feb 2021 15:41:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3101F5D719;
	Wed, 17 Feb 2021 15:41:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7D4318095CE;
	Wed, 17 Feb 2021 15:41:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HFGkE1014675 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 10:16:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB16D206291A; Wed, 17 Feb 2021 15:16:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E69C22062917
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 15:16:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1BAA8919BE
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 15:16:43 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-102-6Y3yjUcNPvuaKHwCnZM7WQ-1; Wed, 17 Feb 2021 10:16:40 -0500
X-MC-Unique: 6Y3yjUcNPvuaKHwCnZM7WQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lCOYO-000bEQ-Tx; Wed, 17 Feb 2021 15:16:16 +0000
Date: Wed, 17 Feb 2021 15:15:48 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20210217151548.GL2858050@casper.infradead.org>
References: <20210217125845.10319-1-jlayton@kernel.org>
	<20210217125845.10319-7-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210217125845.10319-7-jlayton@kernel.org>
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
Cc: linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org, idryomov@gmail.com,
	ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH v2 6/6] ceph: convert ceph_readpages to
	ceph_readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 17, 2021 at 07:58:45AM -0500, Jeff Layton wrote:
> +static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
>  {
> +	struct inode *inode = mapping->host;
>  	struct ceph_inode_info *ci = ceph_inode(inode);
> +	int got = (int)(uintptr_t)priv;
>  
>  	if (got)
>  		ceph_put_cap_refs(ci, got);
>  }
> +const struct netfs_read_request_ops ceph_readahead_netfs_ops = {
> +	.init_rreq		= ceph_init_rreq,
> +	.is_cache_enabled	= ceph_is_cache_enabled,
> +	.begin_cache_operation	= ceph_begin_cache_operation,
> +	.issue_op		= ceph_netfs_issue_op,
> +	.expand_readahead	= ceph_netfs_expand_readahead,
> +	.clamp_length		= ceph_netfs_clamp_length,
> +	.cleanup		= ceph_readahead_cleanup,
> +};

It looks to me like this netfs_read_request_ops is the same as the
ceph_readpage_netfs_ops except for the addition of ceph_readahead_cleanup.
If so, since readpage passes NULL as 'priv', the two read_request_ops
can be the same ... right?

also, you don't need that '(int)' cast -- can be just:

	int got = (uintptr_t)priv;

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


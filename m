Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6426C2B7D29
	for <lists+linux-cachefs@lfdr.de>; Wed, 18 Nov 2020 13:01:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605700860;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H7pZ03n8TK+ZZ16ymzaGxoICosRCZp0rTd23LQ6PrVs=;
	b=QoZ6ge0A/+nLF+fJJbC49qPeWO8wQdFGAkBx+oqcF63waAwuoBa4wajo/Vi2OfUOuWh+Jf
	MqipoEqbHlcXZpaYkSMIX/aiEtC9Mv0raJCDACYSh32fsjPjHp808WLQfGRtfD7C7msatf
	2Q2KdQJbQA+BQDFwfQGQuri5Ik1ofHg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-olsFLBaTN7C2m4-y_RCL8A-1; Wed, 18 Nov 2020 07:00:58 -0500
X-MC-Unique: olsFLBaTN7C2m4-y_RCL8A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54CE08018A1;
	Wed, 18 Nov 2020 12:00:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1ABE6EF52;
	Wed, 18 Nov 2020 12:00:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B1DE180B658;
	Wed, 18 Nov 2020 12:00:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AIC0riE012073 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 07:00:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F78A196FD; Wed, 18 Nov 2020 12:00:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A9F02196FB;
	Wed, 18 Nov 2020 12:00:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1517306.1605699813@warthog.procyon.org.uk>
References: <1517306.1605699813@warthog.procyon.org.uk>
	<1514086.1605697347@warthog.procyon.org.uk>
To: Dominique Martinet <asmadeus@codewreck.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 12:00:47 +0000
Message-ID: <1553535.1605700847@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH] 9p: Convert to new fscache API
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1553534.1605700847.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> +static void v9fs_req_issue_op(struct netfs_read_subrequest *subreq)
>  {
> +	struct netfs_read_request *rreq = subreq->rreq;
> +	struct p9_fid *fid = rreq->netfs_priv;
>  	struct iov_iter to;
> +	loff_t pos = subreq->start + subreq->transferred;
> +	size_t len = subreq->len   - subreq->transferred;
>  	int retval, err;
>  
> +	iov_iter_xarray(&to, READ, &rreq->mapping->i_pages, pos, len);
>  
> +	retval = p9_client_read(fid, pos, &to, &err);
> +	if (retval)
> +		subreq->error = retval;

I forgot something: netfs_subreq_terminated() needs to be called when the read
is complete.  If p9_client_read() is synchronous, then that would be here,
probably something like:

	retval = p9_client_read(fid, pos, &to, &err);
	netfs_subreq_terminated(subreq, retval);

is what's required.  Manually setting subreq->error can then be removed.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16C4983C4
	for <lists+linux-cachefs@lfdr.de>; Mon, 24 Jan 2022 16:46:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643039205;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J3izsmDUdXHqOi8PnjW1vK5R2BlbALTceFJL4wq/gig=;
	b=dyu6X/QDvatKV9n87cSoLzU6zSRDFT0IGub3pbcwVMDE0chrPtdm92rcuUgYzbmYdDCw2s
	MobsYzVE4p89wCKzA9LfsjBzMdiQIkowvBsKpT5WscLS7XeF/xDDkTqp+VEOReCcdSzKAn
	4gwLabV9JTcdr358lSE6JZ7kjw3oWok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-rAePPuaWPmCSHJYUWb9-Kg-1; Mon, 24 Jan 2022 10:46:42 -0500
X-MC-Unique: rAePPuaWPmCSHJYUWb9-Kg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BEED1091DA3;
	Mon, 24 Jan 2022 15:46:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C37415DB85;
	Mon, 24 Jan 2022 15:46:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 968141809CB8;
	Mon, 24 Jan 2022 15:46:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OFkYlG020715 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 10:46:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C9D47C127; Mon, 24 Jan 2022 15:46:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCC59794B2;
	Mon, 24 Jan 2022 15:46:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Ye7GtNRgxkT9S6sG@casper.infradead.org>
References: <Ye7GtNRgxkT9S6sG@casper.infradead.org>
	<Ye61jfhL7K9Ethxz@casper.infradead.org>
	<164303051132.2163193.10493291874899600548.stgit@warthog.procyon.org.uk>
	<2255918.1643037281@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Mon, 24 Jan 2022 15:46:27 +0000
Message-ID: <2270964.1643039187@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, smfrench@gmail.com,
	linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [RFC PATCH] cifs: Transition from ->readpages()
	to ->readahead()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2270963.1643039187.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> > Would it be possible to make readahead_count() do:
> > 
> > 	return rac->_nr_pages - rac->_batch_count;
> > 
> > maybe?
> 
> Yes, I think that would make sense.  Do we also need to change
> readhead_length()?  It seems to me that it's only ever called once at
> initialisation, so it should be possible to keep the two in sync.
> Can you write & test such a patch?  I'll support it going upstream
> (either by taking it myself or giving you a R-b to take it through your
> tree).

It seems I also have a problem with readahead_index() needing compensation
too.  I'm guessing that's more of a problem, however, as I think that's
expected to refer to the beginning of the current batch.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


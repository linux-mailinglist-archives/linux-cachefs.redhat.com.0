Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CA5498359
	for <lists+linux-cachefs@lfdr.de>; Mon, 24 Jan 2022 16:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643037294;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jRdoWB7V8NoW95cBd00cVmoXdCXrkztBx3qmSO1uDog=;
	b=A/SM7vIXEy8A1CZ2SxFXBTMd2h0+B6+IqrY6opX7huLcHIF/w60lj3uYcPLVZioQMhGbPu
	w3hUVNXFvC1HKo253ZsRHCQo1TLZpjOYGxqgQYx6hhcOQ+fzaTwCDjHmmloMlLs4yOGT0C
	s8aXvaOJgLFgN/AzRSzMo0qPpkswTMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-155-yp0YmvrYMjmTVtL_Y4YcLg-1; Mon, 24 Jan 2022 10:14:51 -0500
X-MC-Unique: yp0YmvrYMjmTVtL_Y4YcLg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 814C318C8C01;
	Mon, 24 Jan 2022 15:14:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BF5F7E2EE;
	Mon, 24 Jan 2022 15:14:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52A251809CB8;
	Mon, 24 Jan 2022 15:14:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20OFEhi4018440 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 24 Jan 2022 10:14:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 875D57E915; Mon, 24 Jan 2022 15:14:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3721E7D48A;
	Mon, 24 Jan 2022 15:14:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Ye61jfhL7K9Ethxz@casper.infradead.org>
References: <Ye61jfhL7K9Ethxz@casper.infradead.org>
	<164303051132.2163193.10493291874899600548.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Mon, 24 Jan 2022 15:14:41 +0000
Message-ID: <2255918.1643037281@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2255917.1643037281.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> > Questions for Willy:
> >  - Can we get a function to return the number of pages in a readahead
> >    batch?
> > 
> >  - Can we get a function to commit a readahead batch?  Currently, this is
> >    done when we call __readahead_batch(), but that means ractl->_nr_pages
> >    isn't up to date at the point we need it to be.  However, we want to
> >    check to see if the ractl is empty, then get server credits and only
> >    *then* call __readahead_batch() as we don't know how big a batch we're
> >    allowed till we have the credits.
> 
> If you insist on using the primitives in a way that nobody else uses
> them, you're going to find they don't work.  What's wrong with the
> way that FUSE uses them in fuse_readahead()?

You mean doing this?

		nr_pages = readahead_count(rac) - nr_pages;

that would seem to indicate that the readahead interface is wrong.  Why should
readahead_count() need correction?  I think I can see *why* the batching stuff
is hidden, but it seems that the comment for readahead_count() needs to
mention this if you aren't going to fix it.

Would it be possible to make readahead_count() do:

	return rac->_nr_pages - rac->_batch_count;

maybe?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


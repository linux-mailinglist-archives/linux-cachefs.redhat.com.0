Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E4A49B707
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 Jan 2022 15:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643122712;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gwazN3x+ZGnkjtf4RCYgFX5aXlWUJ1jHlDuo2S8/ck0=;
	b=SFPR3xNWFlBlyobta0A5wYk2tU/+UQr2APB5CyCjnaqIFWGZdp20D0qwjcxQn+wXXuA4gp
	gzFQjhMezTc/C8rLnl6dNVdOc8JkpXwukQsAvZHT0/cqdriptSZ/OR8+otgSWbV1ZT52VL
	fmlkMoQNFl9LNtAIDx/k8VTkDXqbYnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-pobdtRGoORK7eCQLx7wfQQ-1; Tue, 25 Jan 2022 09:58:29 -0500
X-MC-Unique: pobdtRGoORK7eCQLx7wfQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55B6D86A8A2;
	Tue, 25 Jan 2022 14:58:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4860D7D3F4;
	Tue, 25 Jan 2022 14:58:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3A7C4BB7B;
	Tue, 25 Jan 2022 14:58:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20PEvBFp027421 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 Jan 2022 09:57:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4437B7E2F8; Tue, 25 Jan 2022 14:57:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD6B17E2EF;
	Tue, 25 Jan 2022 14:57:04 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YfAHJcXeSsAE4uMB@casper.infradead.org>
References: <YfAHJcXeSsAE4uMB@casper.infradead.org>
	<164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
	<164311906472.2806745.605202239282432844.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Tue, 25 Jan 2022 14:57:03 +0000
Message-ID: <2810189.1643122623@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, smfrench@gmail.com,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC PATCH 1/7] cifs: Transition from
	->readpages() to ->readahead()
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
Content-ID: <2810188.1643122623.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> On Tue, Jan 25, 2022 at 01:57:44PM +0000, David Howells wrote:
> > +	while (readahead_count(ractl) - ractl->_batch_count) {
> 
> You do understand that prefixing a structure member with an '_' means
> "Don't use this", right?  If I could get the compiler to prevent you, I
> would.

Yes, I know.  However, as previously discussed, I think that your
implementation of readahead batching doesn't work right - hence the need to
apply compensation to the values returned by the accessor functions.

Btw, I end up doing this:

		for (i = 0; i < nr_pages; i++)
			if (!readahead_folio(ractl))
				BUG();

in patch 5.  I want to create a batch, but I don't want to be given the array
of addresses of the folios as I'm going to use an xarray-class iterator.
Further, _batch_count at this point is some value related to just the last
folio and not the batch as a whole:-/

(Also, the above won't work if any folios retrieved are larger than a page)

Note that cifs_readahead() is removed in patch 7 and readahead functionality
is offloaded to netfslib, so I'm not sure it's worth spending much time on
fixing.

[I should mention that netfs_readahead() also does:

	while (readahead_folio(ractl))
		;
which could probably be replaced with something better that doesn't keep
taking and dropping the RCU readlock.]

Would you object if I added a function like:

	static inline
	unsigned int readahead_commit_batch(struct readahead_control *rac)
	{
		BUG_ON(rac->_batch_count > rac->_nr_pages);
		rac->_nr_pages -= rac->_batch_count;
		rac->_index += rac->_batch_count;
		rac->_batch_count = 0;
	}

It could then be called from both __readahead_folio() and __readahead_batch().
For __readahead_folio(), the duplicate setting of _batch_count should be
optimised away on the path where a folio is returned.  I could then call this
from the loop in cifs before going round again.

I'd also like to consider adding something like:

	static inline
	void readahead_set_batch(struct readahead_control *rac)
	{
		unsigned int i = 0;
		struct page *page;
		XA_STATE(xas, &rac->mapping->i_pages, 0);

		BUG_ON(rac->_batch_count > rac->_nr_pages);
		rac->_nr_pages -= rac->_batch_count;
		rac->_index += rac->_batch_count;
		rac->_batch_count = 0;

		xas_set(&xas, rac->_index);
		rcu_read_lock();
		xas_for_each(&xas, page, rac->_index + rac->_nr_pages - 1) {
			if (xas_retry(&xas, page))
				continue;
			VM_BUG_ON_PAGE(!PageLocked(page), page);
			VM_BUG_ON_PAGE(PageTail(page), page);
			rac->_batch_count += thp_nr_pages(page);
		}
		rcu_read_unlock();
	}

so that netfslib can use it to load all the pages it is given into a batch
without retrieving the page pointers.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


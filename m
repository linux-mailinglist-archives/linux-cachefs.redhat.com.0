Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id DCBC53EAC26
	for <lists+linux-cachefs@lfdr.de>; Thu, 12 Aug 2021 22:58:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628801880;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MURmLEEuy4KprMGOtFryQIMmbHRTVjtm2NukZtE5U4U=;
	b=TzYY+0ygrAbZUL6j82FBFl90x2ZoH7NzrVkbTRmPjC2W7qGBaPKxgSymNw2nTzYp6PSt8S
	KCZVVgemnoqsx0zgIqQ1SFzbfZx/rSEcj909UzjpT+quQ0+YRTXR14Sg3m90eFlVCO7SN0
	r+6kMdcoqrC1XE+38jJlGOKmGNyuHVw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-QfIqRLAGNtSYrlwuD3h5Vw-1; Thu, 12 Aug 2021 16:57:58 -0400
X-MC-Unique: QfIqRLAGNtSYrlwuD3h5Vw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3FE78042DB;
	Thu, 12 Aug 2021 20:57:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B31EC6A05F;
	Thu, 12 Aug 2021 20:57:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D047181A1CD;
	Thu, 12 Aug 2021 20:57:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17CKm0SH019556 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 12 Aug 2021 16:48:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7DC6C12C82; Thu, 12 Aug 2021 20:48:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.22.32.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 158125D9D5;
	Thu, 12 Aug 2021 20:47:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YRVHLu3OAwylCONm@casper.infradead.org>
References: <YRVHLu3OAwylCONm@casper.infradead.org>
	<2408234.1628687271@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Thu, 12 Aug 2021 21:47:54 +0100
Message-ID: <3308343.1628801274@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 17CKm0SH019556
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [RFC][PATCH] netfs, afs, ceph: Use folios
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3308342.1628801274.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> >  (*) Can page_endio() be split into two separate functions, one for read
> >      and one for write?  If seems a waste of time to conditionally switch
> >      between two different branches.
> 
> At this point I'm thinking ...
> 
> static inline void folio_end_read(struct folio *folio, int err)
> {
> 	if (!err)
> 		folio_set_uptodate(folio);
> 	folio_unlock(folio);
> }
> 
> Clearly the page isn't uptodate at this point, or ->readpage wouldn't've
> been called.  So there's no need to clear it.  And PageError is
> completely useless.

Seems reasonable.

> > -	*_page = page;
> > +	*_page = &folio->page;
> 
> Can't do anything about this one; the write_begin API needs to be fixed.

That's fine.  I expected things like this at this stage.

> > @@ -174,40 +175,32 @@ static void afs_kill_pages(struct address_space *mapping,
> [...]
> > +		folio_clear_uptodate(folio);
> > +		folio_end_writeback(folio);
> > +		folio_lock(folio);
> > +		generic_error_remove_page(mapping, &folio->page);
> > +		folio_unlock(folio);
> > +		folio_put(folio);
> 
> This one I'm entirely missing.  It's awkward.  I'll work on it.

afs_kill_pages() is just a utility to end writeback, clear uptodate and do
generic_error_remove_page() over a range of pages and afs_redirty_pages() is a
utility that to end writeback and redirty a range of pages - hence why I was
thinking it might make sense to put them into common code.

> > -			index += thp_nr_pages(page);
> > -			if (!pagevec_add(&pvec, page))
> > +			index += folio_nr_pages(folio);
> > +			if (!pagevec_add(&pvec, &folio->page))
> 
> Pagevecs are also awkward.  I haven't quite figured out how to
> transition them to folios.

Maybe provide pagevec_add_folio(struct pagevec *, struct folio *)?

> >  zero_out:
> > -	zero_user_segments(page, 0, offset, offset + len, thp_size(page));
> > +	zero_user_segments(&folio->page, 0, offset, offset + len, folio_size(folio));
> 
> Yeah, that's ugly.

Maybe:

	folio_clear_around(folio, keep_from, keep_to);

clearing the bits of the folio outside the specified section?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFD362948D
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Nov 2022 10:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668505262;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5d1n2OmUPjiTn6pBDLSh531dNCG+t9H9LLBP4vgZBDU=;
	b=Af8ViMz+Qj8XsprB4ruXe5h7JYinU9OmOpYKNYaXZTxucrk3EouQPjLBNTNZHdPK/w+qcM
	q9XPycTDJFIQl9udAfnu7sVv+R/oVmFmCZuYQdBMDhmiU7S8WP8gtBJvj1ZjEyCZh2AVqM
	lMR/bmczP9gl6j5qr884unN5fufLnfw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-dWumFHtONymQ42NSmPfrOA-1; Tue, 15 Nov 2022 04:40:59 -0500
X-MC-Unique: dWumFHtONymQ42NSmPfrOA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF282185A792;
	Tue, 15 Nov 2022 09:40:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 22863492B05;
	Tue, 15 Nov 2022 09:40:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 78470194658D;
	Tue, 15 Nov 2022 09:40:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5E49F1946588 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 15 Nov 2022 09:40:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 000AB2028E8F; Tue, 15 Nov 2022 09:40:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9A352024CC0;
 Tue, 15 Nov 2022 09:40:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Y3MQ4l1AJOgniprT@casper.infradead.org>
References: <Y3MQ4l1AJOgniprT@casper.infradead.org>
 <166844174069.1124521.10890506360974169994.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Tue, 15 Nov 2022 09:40:49 +0000
Message-ID: <1493972.1668505249@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Linux-cachefs] [RFC PATCH v2] mm, netfs,
 fscache: Stop read optimisation when folio removed from pagecache
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
 linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org,
 Rohith Surabattula <rohiths.msft@gmail.com>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-mm@kvack.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1493971.1668505249.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> On Mon, Nov 14, 2022 at 04:02:20PM +0000, David Howells wrote:
> > +++ b/mm/filemap.c
> > @@ -3941,6 +3941,10 @@ bool filemap_release_folio(struct folio *folio, gfp_t gfp)
> >  	struct address_space * const mapping = folio->mapping;
> >  
> >  	BUG_ON(!folio_test_locked(folio));
> > +	if ((!mapping || !mapping_release_always(mapping))
> > +	    && !folio_test_private(folio) &&
> > +	    !folio_test_private_2(folio))
> > +		return true;
> 
> Why do you need to test 'mapping' here?

Why does the function do:

	if (mapping && mapping->a_ops->release_folio)

later then?  There are callers of the function, such as shrink_folio_list(),
that seem to think that folio->mapping might be NULL.

> Also this is the most inconsistent style ...

Yeah, I accidentally pushed the '&&' onto the next line.

> > @@ -276,7 +275,7 @@ static long mapping_evict_folio(struct address_space *mapping,
> >  	if (folio_ref_count(folio) >
> >  			folio_nr_pages(folio) + folio_has_private(folio) + 1)
> 
> I think this line is incorrect, right?  You don't increment the folio
> refcount just because the folio has private2 set, do you?

Errr, yes:

	static inline void folio_start_fscache(struct folio *folio)
	{
		VM_BUG_ON_FOLIO(folio_test_private_2(folio), folio);
		folio_get(folio);
		folio_set_private_2(folio);
	}

Someone insisted - might even have been you;-)

I'm working on getting rid of the use of PG_private_2 from the network
filesystems, but it's still in progress.  Kind of blocked on the iov_iter
stuff.

> >  		return 0;
> > -	if (folio_has_private(folio) && !filemap_release_folio(folio, 0))
> > +	if (!filemap_release_folio(folio, 0))
> >  		return 0;
> >  
> >  	return remove_mapping(mapping, folio);
> 
> Can we get rid of folio_has_private()

That would be nice, but there are still places that check it, and until we get
rid of the use of PG_private_2, we can't reduce it to just a check on
PG_private.  Truncate, for example, checks it to see if it should can
->invalidate_folio().

It's only used in mm/, so it could be moved into mm/internal.h.

> / page_has_private() now?

That's used in some a number of places outside of mm/.  The arch/s390/ usage
is just to calculate the expected refcount.  I wonder if calculation of the
expected refcount could be potted into a function as it's performed in a
number of places - though the expectation isn't always the same.

Ext3 and fuse both use it - but those probably need to check PG_private_2 and
could use a "folio_test_private()" function when fully foliated.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


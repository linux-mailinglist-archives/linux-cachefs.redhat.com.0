Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8DF433EE7
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Oct 2021 21:01:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634670088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4sM2kwL1poAbNNsO/ZdKNh4hLYa/wDLpUhgSW8sRawQ=;
	b=PskKZciIXyj8RD4vkG0iJlIj2fDck0nzofdm8Fb4MJNHsNtWGUiW27aV1crmtbmJP+Fx48
	bKN3blXrNy7BfcUqtR3VBcYOAF5m2RuHhzqcRNnGg42sK9vefPRkLsx1+f07qFLtpTrgMg
	SAkJY6lQxUY+r1d+8oK6CcOhkhf4np8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-ZGukzqPNNoq6FinVkSF3DA-1; Tue, 19 Oct 2021 15:01:24 -0400
X-MC-Unique: ZGukzqPNNoq6FinVkSF3DA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA5C58031EE;
	Tue, 19 Oct 2021 19:01:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 640EA641A7;
	Tue, 19 Oct 2021 19:01:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61F3E4A703;
	Tue, 19 Oct 2021 19:01:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JJ1HTh023435 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 15:01:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 96EA36A90A; Tue, 19 Oct 2021 19:01:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EB0645D6D7;
	Tue, 19 Oct 2021 19:00:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <b2ea9fdf90939731c08329575c8843e8db5f3219.camel@kernel.org>
References: <b2ea9fdf90939731c08329575c8843e8db5f3219.camel@kernel.org>
	<163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Tue, 19 Oct 2021 20:00:49 +0100
Message-ID: <2972094.1634670049@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
	Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>,
	linux-cifs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com, Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 00/67] fscache: Rewrite index API and
	management system
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
Content-ID: <2972093.1634670049.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> Given the indexing changes, what sort of behavior should we expect when
> upgrading from old-style to new-style indexes? Do they just not match,
> and we end up downloading new copies of all the data and the old stale
> stuff eventually gets culled?

Correct: they don't match.  The names of the directories and files will be
quite different - and so will the attached xattrs.  However, no filesystems
currently store locally-modified data in the cache, so you shouldn't lose any
data after upgrading.

> Ditto for downgrades -- can we expect sane behavior if someone runs an
> old kernel on top of an existing fscache that was populated by a new
> kernel?

Correct.  With this branch, filesystems now store locally-modified data into
the cache - but they also upload it to the server at the same time.  If
there's a disagreement between what's in the cache and what's on the server
with this branch, the cache is discarded, so simply discarding the cache on a
download shouldn't be a problem.

It's currently operating as a write-through cache, not a write-back cache.
That will change if I get round to implementing disconnected operation, but
it's not there yet.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


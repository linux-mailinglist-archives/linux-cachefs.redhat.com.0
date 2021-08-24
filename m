Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F83A3F5FF1
	for <lists+linux-cachefs@lfdr.de>; Tue, 24 Aug 2021 16:12:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629814318;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qEbt/ed3kaK8zsEyX9+FG/jS2o42o873wN+YQxH/LGE=;
	b=WZCQjjyWzoucukJrStievSNUevjuT8UMvEtwJ8Uhiur7ttYGA1V6oWfvykCa8FmTrfMVSI
	knTteDpBUTZMQlCP6HlNjYseaTms9psWcCcnaQQje47MvZJml5YK9uCmAK53B6bJxUzD1k
	eOBCOvCbWuC+fHkQUuNuWEFcd9G/cDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-KleAVsAAMr2vHKpjrixqAw-1; Tue, 24 Aug 2021 10:11:57 -0400
X-MC-Unique: KleAVsAAMr2vHKpjrixqAw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A560100A605;
	Tue, 24 Aug 2021 14:11:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDB9D2C00F;
	Tue, 24 Aug 2021 14:11:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E92C1819AC9;
	Tue, 24 Aug 2021 14:11:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OEBrkX001179 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 10:11:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0240617567; Tue, 24 Aug 2021 14:11:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC8415C25A;
	Tue, 24 Aug 2021 14:11:46 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YST8OcVNy02Rivbm@casper.infradead.org>
References: <YST8OcVNy02Rivbm@casper.infradead.org>
	<162981147473.1901565.1455657509200944265.stgit@warthog.procyon.org.uk>
	<162981151155.1901565.7010079316994382707.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Tue, 24 Aug 2021 15:11:45 +0100
Message-ID: <1951630.1629814305@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	v9fs-developer@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: Re: [Linux-cachefs] [PATCH 3/6] folio: Add a function to get the
	host inode for a folio
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
Content-ID: <1951629.1629814305.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> > +static inline struct inode *folio_inode(struct folio *folio)
> > +{
> > +	return folio_file_mapping(folio)->host;
> 
> You're contradicting yourself here.  If you're allowed to call this
> function for swap cache pages, then the documentation needs to change.
> If you're not, then we can just use folio->mapping->host.

Um.  I don't know.  I'll do the latter, then, for now.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C869E628E87
	for <lists+linux-cachefs@lfdr.de>; Tue, 15 Nov 2022 01:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668472877;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BHExlkUnB4mZWv0pFvqqDbzdrfRfaiBnZ95nyJ5U0Nk=;
	b=gEXZpA5BJzXhtQa9RPGDq07Qao0V2pgtqMiiKxO+0IvPe+iuztZcU4sK6ulE2TdkQEruMd
	CQnKQMWwGQoLWwT8Te+4/sYtOaOl2GIaf8CKdd52BxqKve4CQtDNetkpPXBlTIq0rLb0+S
	FrGJ38ujLfODe4eBGbX9CT/47s3puhQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-OQj-mZ_-OAaaLEmGStgP3A-1; Mon, 14 Nov 2022 19:41:15 -0500
X-MC-Unique: OQj-mZ_-OAaaLEmGStgP3A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 707B3800B30;
	Tue, 15 Nov 2022 00:41:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6775C2166B2B;
	Tue, 15 Nov 2022 00:41:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 07EBF194658F;
	Tue, 15 Nov 2022 00:41:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 980771946589 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 15 Nov 2022 00:41:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7C5C6400DFDF; Tue, 15 Nov 2022 00:41:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75D27400DFD4;
 Tue, 15 Nov 2022 00:41:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Y3Lbul7FZncNVwVZ@codewreck.org>
References: <Y3Lbul7FZncNVwVZ@codewreck.org>
 <166844174069.1124521.10890506360974169994.stgit@warthog.procyon.org.uk>
To: Dominique Martinet <asmadeus@codewreck.org>
MIME-Version: 1.0
Date: Tue, 15 Nov 2022 00:41:02 +0000
Message-ID: <1457985.1668472862@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
 linux-kernel@vger.kernel.org, willy@infradead.org, linux-mm@kvack.org,
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1457984.1668472862.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dominique Martinet <asmadeus@codewreck.org> wrote:

> any harm in setting this if netfs isn't enabled?
> (just asking because you checked in fs/9p/cache.c above)

Well, it forces a call to ->release_folio() every time a folio is released, if
set, rather than just if PG_private/PG_private_2 is set.

> > +static inline void mapping_clear_release_always(struct address_space *mapping)
> > +{
> > +	set_bit(AS_RELEASE_ALWAYS, &mapping->flags);
> 
> clear_bit certainly?

Bah.  Yes.

> > -	if (folio_has_private(folio) && !filemap_release_folio(folio, 0))
> > +	if (!filemap_release_folio(folio, 0))
> 
> should this (and all others) check for folio_needs_release instead of has_private?
> filemap_release_folio doesn't check as far as I can see, but perhaps
> it's already fast and noop for another reason I didn't see.

Willy suggested merging the checks from folio_has_private() into
filemap_release_folio():

	https://lore.kernel.org/r/Yk9V/03wgdYi65Lb@casper.infradead.org/

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


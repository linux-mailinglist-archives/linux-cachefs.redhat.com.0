Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 418294F7679
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 08:42:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649313745;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sja+oAGyUelquXjyJy+LOKloCNgsqFpQJ4zP3R5Fe04=;
	b=SPqmXGYI/qFnis2u1BuQ3J0rWBUAM16z/3sdmL8wUtH1g/4ZFRv/Us5aFJ5JyDZq1P5ODH
	sv32NsbWd9u1/Cu6RTXxSvoqWbCMIwMaD4Ub7kfoUrhs8XaB3PtmT2eVfsz27yf3KBi3+n
	7qDGMINKepx4BUc/+tei/EQ31DUJM1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-5Ke_k0g0OkuwhFTWuTYMvA-1; Thu, 07 Apr 2022 02:42:22 -0400
X-MC-Unique: 5Ke_k0g0OkuwhFTWuTYMvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEEFF811E84;
	Thu,  7 Apr 2022 06:42:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EEE042D3B1;
	Thu,  7 Apr 2022 06:41:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 384B1194034E;
	Thu,  7 Apr 2022 06:41:56 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 735121949763 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 06:41:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4046341636E; Thu,  7 Apr 2022 06:41:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E753D401E2B;
 Thu,  7 Apr 2022 06:41:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Yk5W6zvvftOB+80D@casper.infradead.org>
References: <Yk5W6zvvftOB+80D@casper.infradead.org>
 <164928615045.457102.10607899252434268982.stgit@warthog.procyon.org.uk>
 <164928630577.457102.8519251179327601178.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Thu, 07 Apr 2022 07:41:47 +0100
Message-ID: <469869.1649313707@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH 14/14] mm, netfs,
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
 linux-cifs@vger.kernel.org, Rohith Surabattula <rohiths.msft@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <469868.1649313707.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> On Thu, Apr 07, 2022 at 12:05:05AM +0100, David Howells wrote:
> > Fix this by adding an extra address_space operation, ->removing folio(),
> > and flag, AS_NOTIFY_REMOVING_FOLIO.  The operation is called if the flag is
> > set when a folio is removed from the pagecache.  The flag should be set if
> > a non-NULL cookie is obtained from fscache and cleared in ->evict_inode()
> > before truncate_inode_pages_final() is called.
> 
> What's wrong with ->freepage?

It's too late.  The optimisation must be cancelled before there's a chance
that a new page can be allocated and attached to the pagecache - but
->freepage() is called after the folio has been removed.  Doing it in
->freepage() would allow ->readahead(), ->readpage() or ->write_begin() to
jump in and start a new read (which gets skipped because the optimisation is
still in play).

Another possibility could be that the FSCACHE_COOKIE_HAVE_DATA and
FSCACHE_COOKIE_NO_DATA_TO_READ flags could be moved from cookie->flags to
mapping->flags and the VM could do the twiddling itself (no aop required) -
except that fscache can't currently then find them (maybe use an aop for
that?).

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


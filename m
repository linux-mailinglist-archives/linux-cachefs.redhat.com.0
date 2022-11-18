Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B5762F345
	for <lists+linux-cachefs@lfdr.de>; Fri, 18 Nov 2022 12:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668769651;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ad4aUIsoZyY2Xk4cylpsjL/VjltYw3vJ9kuW1MWHX3g=;
	b=cafrvfePeTWglsUHzZEBZx29qCmEjicg5D2S4UuzPKOubp2zvSFLvXny8acMgHy0VoPVK0
	iQnxebqcs9RdfZ/5+xde7KCQO9dWh8gls9SaobGm4O0ylbQ3BrfuoBqWx1iIHoHkmNbZ2U
	ndH7aGxkuxF7TWV89iroHS9Xjmw5/a4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-FG0_UzF9NgW9x-vs5-biZQ-1; Fri, 18 Nov 2022 06:07:28 -0500
X-MC-Unique: FG0_UzF9NgW9x-vs5-biZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA62C3C0D196;
	Fri, 18 Nov 2022 11:07:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2F52027063;
	Fri, 18 Nov 2022 11:07:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 73CAB19465B7;
	Fri, 18 Nov 2022 11:07:24 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA80F1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 18 Nov 2022 11:07:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 48E1D40E978A; Fri, 18 Nov 2022 11:07:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D418640C6EC3;
 Fri, 18 Nov 2022 11:07:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <166869690376.3723671.8813331570219190705.stgit@warthog.procyon.org.uk>
References: <166869690376.3723671.8813331570219190705.stgit@warthog.procyon.org.uk>
 <166869687556.3723671.10061142538708346995.stgit@warthog.procyon.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
MIME-Version: 1.0
Date: Fri, 18 Nov 2022 11:07:13 +0000
Message-ID: <231863.1668769633@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [RFC PATCH 3/4] netfs: Add a function to
 extract a UBUF or IOVEC into a BVEC iterator
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
 Christoph Hellwig <hch@infradead.org>, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <231862.1668769633.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I updated the commit message to stop using pinning in a general sense:

    netfs: Add a function to extract a UBUF or IOVEC into a BVEC iterator
    
    Add a function to extract the pages from a user-space supplied iterator
    (UBUF- or IOVEC-type) into a BVEC-type iterator, retaining the pages by
    getting a ref on them (WRITE) or pinning them (READ) as we go.
    
    This is useful in three situations:
    
     (1) A userspace thread may have a sibling that unmaps or remaps the
         process's VM during the operation, changing the assignment of the
         pages and potentially causing an error.  Retaining the pages keeps
         some pages around, even if this occurs; futher, we find out at the
         point of extraction if EFAULT is going to be incurred.
    
     (2) Pages might get swapped out/discarded if not retained, so we want to
         retain them to avoid the reload causing a deadlock due to a DIO
         from/to an mmapped region on the same file.
    
     (3) The iterator may get passed to sendmsg() by the filesystem.  If a
         fault occurs, we may get a short write to a TCP stream that's then
         tricky to recover from.
    
    We don't deal with other types of iterator here, leaving it to other
    mechanisms to retain the pages (eg. PG_locked, PG_writeback and the pipe
    lock).

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


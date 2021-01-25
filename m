Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B5E37302EB2
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jan 2021 23:11:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611612663;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H8ZgK7J0GRlLKEPYvSIaeSsy/sHylV757gCCk1ogk9Q=;
	b=R1JHl8dyxKG/nbblQ7GvlwNhZOGpl7IMvhlurVIqguTFq3/uqZX9/Xxka608c+fAFRvef3
	CeUGoQsulG+erKThQbS6kTyy/yRU/w/vlmgd0Rootv6+JAtEqGpxRWb09kPi2MzYrWeEOj
	IQ5BN/9PDZSOlXuyOpVqZxfyCgy7+0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-bMm5w8d7NHmMMWKEI_e_PA-1; Mon, 25 Jan 2021 17:11:02 -0500
X-MC-Unique: bMm5w8d7NHmMMWKEI_e_PA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 132A918C8C03;
	Mon, 25 Jan 2021 22:11:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5EB560C47;
	Mon, 25 Jan 2021 22:10:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3E9E4BB7B;
	Mon, 25 Jan 2021 22:10:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PMAuVw000691 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 17:10:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09EAC5D9E2; Mon, 25 Jan 2021 22:10:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com
	[10.10.115.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A714B5D9DB;
	Mon, 25 Jan 2021 22:10:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
MIME-Version: 1.0
Date: Mon, 25 Jan 2021 22:10:50 +0000
Message-ID: <2543104.1611612650@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com
Subject: [Linux-cachefs] How to handle NFS patches for fscache I/O partial
	rewrite?
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2543103.1611612650.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Trond, Anna,

As you may have seen, I've managed to cut down the fscache overhaul to add a
glue layer to handle reads and switch to using async DIO through kiocbs rather
than using sync write and async reads with page wait list snooping.  All the
rest of the API is unchanged (for the moment).

The glue layer (netfs helper library) handles the new VM readahead stuff and
reading transparent huge pages on behalf of the netfs, plus read shaping,
splitting and retrying.

Dave Wysochanski created some NFS patches for it, which I posted as part of my
branch.  I'd like to get them into linux-next with an eye to having them
pulled by Linus in the next merge window, along with the rest of my branch.

Should I keep them in my branch and thence into linux-next, or do they need to
go through one of your branches?

Thanks,
David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7E6218E8
	for <lists+linux-cachefs@lfdr.de>; Tue,  8 Nov 2022 16:59:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667923157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ERYYX0TvH4qZDhk1Qif7YNU4uzK7Cth8TZTcSUJ3JJg=;
	b=M726TGhlu59IkH0DP0vn7yReAXcl44jFf/hpW7va5y/9dC57c+eVGKjoZ80ougqKP8b3N1
	iXDgls3RX7oJC+NUgBZraXvLYqjMhS1UeeZAOCCJ1qLw397Ga2FzPBV8ikMhppdkjVjvOX
	rFy2w9JHtVExtqIqdbji4iNeOsW9/q8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-5FY3S68tOuCzy9neJYcP5A-1; Tue, 08 Nov 2022 10:59:14 -0500
X-MC-Unique: 5FY3S68tOuCzy9neJYcP5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07B3B3804507;
	Tue,  8 Nov 2022 15:59:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7129D35429;
	Tue,  8 Nov 2022 15:59:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24CFB1946597;
	Tue,  8 Nov 2022 15:59:12 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1EB7C1946588 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  8 Nov 2022 15:59:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C76D2166B35; Tue,  8 Nov 2022 15:59:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 492082166B29;
 Tue,  8 Nov 2022 15:59:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <084d78a4-6052-f2ec-72f2-af9c4979f5dc@linux.alibaba.com>
References: <084d78a4-6052-f2ec-72f2-af9c4979f5dc@linux.alibaba.com>
 <166757987929.950645.12595273010425381286.stgit@warthog.procyon.org.uk>
 <166757988611.950645.7626959069846893164.stgit@warthog.procyon.org.uk>
To: JeffleXu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Tue, 08 Nov 2022 15:59:08 +0000
Message-ID: <2363340.1667923148@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH v2 2/2] netfs: Fix dodgy maths
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 willy@infradead.org, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2363339.1667923148.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

JeffleXu <jefflexu@linux.alibaba.com> wrote:

> > Fix the dodgy maths in netfs_rreq_unlock_folios().  start_page could be
> > inside the folio, in which case the calculation of pgpos will be come up
> > with a negative number (though for the moment rreq->start is rounded down
> > earlier and folios would have to get merged whilst locked)
> 
> Hi, the patch itself seems fine. Just some questions about the scenario.
> 
> 1. "start_page could be inside the folio" Is that because
> .expand_readahead() called from netfs_readahead()? Since otherwise,
> req-start is always aligned to the folio boundary.

At the moment, rreq->start is always coincident with the start of the first
folio in the collection because we always read whole folios - however, it
might be best to assume that this might not always hold true if it's simple to
fix the maths to get rid of the assumption.

> 2. If start_page is indeed inside the folio, then only the trailing part
> of the first folio can be covered by the request, and this folio will be
> marked with uptodate, though the beginning part of the folio may have
> not been read from the cache. Is that expected? Or correct me if I'm wrong.

For the moment there's no scenario where this arises; I think we need to wait
until we have a scenario and then see how we'll need to juggle the flags.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


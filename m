Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 368EA4226C3
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Oct 2021 14:35:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633437332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5d9Te7DBL8Log5Yr2AN+3n1c5oW1bCnswdXlxUZx0Is=;
	b=UeWk37mBCG1oQVXYXWM1MNNjvXz9mQ7q8MTbDRF4ZNfcUn6fbvbSLaV9shgNGUIZRJcx4i
	Ygk/i/+ls2Gly0ooMwHMXnuCV/aFFVgR/KbT4PRfVq8esnAaoh7ZBMExbRmLNrZ/zlRFod
	ID5CrB04qERbfxPHhFzq8vO86iQYLXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-CMst5a3IOK6zjTq7aaY0Pg-1; Tue, 05 Oct 2021 08:35:31 -0400
X-MC-Unique: CMst5a3IOK6zjTq7aaY0Pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11BCA100C612;
	Tue,  5 Oct 2021 12:35:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33DB35F4E8;
	Tue,  5 Oct 2021 12:35:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61DD61809C84;
	Tue,  5 Oct 2021 12:35:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195CVa5F001846 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 08:31:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2CB21037E95; Tue,  5 Oct 2021 12:31:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6BC971036B3A;
	Tue,  5 Oct 2021 12:31:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <980957.1633427535@warthog.procyon.org.uk>
References: <980957.1633427535@warthog.procyon.org.uk>
	<1633288958-8481-1-git-send-email-dwysocha@redhat.com>
MIME-Version: 1.0
Date: Tue, 05 Oct 2021 13:31:34 +0100
Message-ID: <1077510.1633437094@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 195CVa5F001846
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v1 0/7] Various NFS fscache cleanups
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-ID: <1077509.1633437094.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> > This patchset is on top of David Howells fscache-iter-3 branch, which
> > he posted v2 recently
> > https://lore.kernel.org/all/163189104510.2509237.10805032055807259087.stgit@warthog.procyon.org.uk/
> > 
> > The first patch in this series should probably be merged into David Howells
> > 3/8 patch of that series.  Otherwise, these patches are applied on top of
> > his series, and this series is mostly orthogonal to fscache-iter-3 branch.
> 
> I've added it to my series, putting it in front of my nfs patch.  Your changes
> there aren't really anything to do with mine, so I don't think they want
> merging together.

Ah - I got confused by the "3/8 patch" bit and took patch 3, not patch 1.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


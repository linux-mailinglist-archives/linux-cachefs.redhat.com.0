Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A5CAA42279D
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Oct 2021 15:18:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633439891;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yg5fK7aog3EFp2Xj32cNaHmpKI9sOETqZ4b3j88epsw=;
	b=aCpu5VxMqypjSp4iRoZE7VMAM76vmRUlCC7NvV89c7NA6tItwbVxvAvY42iO+nBeWfQ8/Z
	J24tg+8cVNphDEY4AWlIoPZTehywS4yRd+kD3w0DpD45ymGt8DoGZYJFIrnkiLbXFimFJm
	1CEvuk8mzzfS/k90fmgUqeXM7OV+R/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-FYFjaVuiNzmomI-i0emrZQ-1; Tue, 05 Oct 2021 09:18:10 -0400
X-MC-Unique: FYFjaVuiNzmomI-i0emrZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 627D819057A4;
	Tue,  5 Oct 2021 13:18:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 021CC9AA2B;
	Tue,  5 Oct 2021 13:18:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 343F74E58E;
	Tue,  5 Oct 2021 13:18:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195DFhsL005835 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 09:15:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 17E1B17C58; Tue,  5 Oct 2021 13:15:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.44])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 758A853E08;
	Tue,  5 Oct 2021 13:15:41 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <23033528036059af4633f60b8325e48eab95ac36.camel@hammerspace.com>
References: <23033528036059af4633f60b8325e48eab95ac36.camel@hammerspace.com>
	<97eb17f51c8fd9a89f10d9dd0bf35f1075f6b236.camel@hammerspace.com>
	<163189104510.2509237.10805032055807259087.stgit@warthog.procyon.org.uk>
	<163189108292.2509237.12615909591150927232.stgit@warthog.procyon.org.uk>
	<CALF+zO=165sRYRaxPpDS7DaQCpTe-YOa4FamSoMy5FV2uuG5Yg@mail.gmail.com>
	<81120.1633099916@warthog.procyon.org.uk>
To: Trond Myklebust <trondmy@hammerspace.com>
MIME-Version: 1.0
Date: Tue, 05 Oct 2021 14:15:40 +0100
Message-ID: <1080874.1633439740@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"willy@infradead.org" <willy@infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] Can the GFP flags to releasepage() be trusted?
	-- was Re: [PATCH v2 3/8] nfs: Move to using the alternate
	fallback fscache I/O API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <1080873.1633439740.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Trond Myklebust <trondmy@hammerspace.com> wrote:

> To elaborate a bit: we used to have code here that would check whether
> the page had been cleaned but was unstable, and if an argument of
> GFP_KERNEL or above was set, we'd try to call COMMIT to ensure the page
> was synched to disk on the server (and we'd wait for that call to
> complete).
> 
> That code would end up deadlocking in all sorts of horrible ways, so we
> ended up having to pull it.

I don't think that a deadlock should be possible with this.  PG_fscache is now
only being used to indicate that a DIO write to the cache is in progress on
the page.  It will complete and remove the mark at some point.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


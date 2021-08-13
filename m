Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 02F7B3EB273
	for <lists+linux-cachefs@lfdr.de>; Fri, 13 Aug 2021 10:17:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1628842664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AQs6v9ZyrX5exlWaKx5Fh0c8/aXZQc/ZEFBAgXt2neo=;
	b=QOxsPQGDB/s3IXplAVr6I5ZJZpEh1ATdhlzSwEWFjEoVvTca14Cgmj7Y/79VlJo5nf44Hz
	2QDZiQMDc5VogS/4YE6LW0LyggNtlTMnWqCTiMgwHSrGEj1TdPVEY/u2E4kXxOvxh2Ps5e
	ZOzSa/yeH0FXopdMZkw9ww6stFpmp+g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-5wBxBdLNOn2618hO8qXC9A-1; Fri, 13 Aug 2021 04:17:42 -0400
X-MC-Unique: 5wBxBdLNOn2618hO8qXC9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBC995F9CF;
	Fri, 13 Aug 2021 08:17:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FC2F100763B;
	Fri, 13 Aug 2021 08:17:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B55F84BB7B;
	Fri, 13 Aug 2021 08:17:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17D8HZQW023645 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 13 Aug 2021 04:17:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C3BE18017; Fri, 13 Aug 2021 08:17:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.22.32.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51BD95C3E0;
	Fri, 13 Aug 2021 08:17:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <YRYXAii0zZ0SzDt+@infradead.org>
References: <YRYXAii0zZ0SzDt+@infradead.org>
	<2408234.1628687271@warthog.procyon.org.uk>
	<YRVHLu3OAwylCONm@casper.infradead.org>
To: Christoph Hellwig <hch@infradead.org>
MIME-Version: 1.0
Date: Fri, 13 Aug 2021 09:17:28 +0100
Message-ID: <3449254.1628842648@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
	ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [RFC][PATCH] netfs, afs, ceph: Use folios
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3449253.1628842648.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Christoph Hellwig <hch@infradead.org> wrote:

> It actually needs to go away.  There's not real good use for that level
> of API. netfs should just open code the releavant parts of
> generic_perform_write, similar to iomap.

I'm working on doing that in netfs lib, with the intent of sharing it between
at least afs, ceph, cifs and 9p.  It reduces the cost of accessing fscache
for large writes that span multiple pages.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


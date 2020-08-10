Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E7E2924047D
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Aug 2020 12:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597054171;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9ytdeBM8OiOIzq/fC5RM5M3ebjpDHXUoc119dU7xv3w=;
	b=Zt3jES+3zIiCsA09hioZ2HEKynTjz6yWvMPy3GL2O+J2GUb7gFRn2hxX3gHouK7JeWKfco
	wjlRDLVhOC4MqRkMGy04pVY37em24iIhte+v7udk/gt3V5+8lAMBm+xTxEBWGr8XrEYDVX
	+Zbui1oKP/f1yazrJ4uClmHQZqmn82k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-xU-X35ahMPy22DZLYIqvKA-1; Mon, 10 Aug 2020 06:09:30 -0400
X-MC-Unique: xU-X35ahMPy22DZLYIqvKA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22B0E1902EAE;
	Mon, 10 Aug 2020 10:09:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55ACE5D9D7;
	Mon, 10 Aug 2020 10:09:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 782DA1809554;
	Mon, 10 Aug 2020 10:09:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AA9KVr030664 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 06:09:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8276B8BD63; Mon, 10 Aug 2020 10:09:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-113-69.rdu2.redhat.com
	[10.10.113.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 98F505F1EA;
	Mon, 10 Aug 2020 10:09:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CALF+zOnQ6diJv4bMbf-HSYmHusT_iE1dAqp-j_kjuqyLqfp-nw@mail.gmail.com>
References: <CALF+zOnQ6diJv4bMbf-HSYmHusT_iE1dAqp-j_kjuqyLqfp-nw@mail.gmail.com>
	<20200731130421.127022-1-jlayton@kernel.org>
	<20200731130421.127022-10-jlayton@kernel.org>
To: David Wysochanski <dwysocha@redhat.com>
MIME-Version: 1.0
Content-ID: <526037.1597054155.1@warthog.procyon.org.uk>
Date: Mon, 10 Aug 2020 11:09:15 +0100
Message-ID: <526038.1597054155@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: ceph-devel@vger.kernel.org, linux-cachefs@redhat.com,
	Jeff Layton <jlayton@kernel.org>, idryomov@gmail.com
Subject: Re: [Linux-cachefs] [RFC PATCH v2 09/11] ceph: convert readpages to
	fscache_read_helper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Wysochanski <dwysocha@redhat.com> wrote:

> Looks like fscache_shape_request() overrides any 'max_pages' value (actually
> it is cachefiles_shape_request) , so it's unclear why the netfs would pass
> in a 'max_pages' if it is not honored - seems like a bug maybe or it's not
> obvious

I think the problem is that cachefiles_shape_request() is applying the limit
too early.  It's using it to cut down the number of pages in the original
request (only applicable to readpages), but then the shaping to fit cache
granules can exceed that, so it needs to be applied later also.

Does the attached patch help?

David
---
diff --git a/fs/cachefiles/content-map.c b/fs/cachefiles/content-map.c
index 2bfba2e41c39..ce05cf1d9a6e 100644
--- a/fs/cachefiles/content-map.c
+++ b/fs/cachefiles/content-map.c
@@ -134,7 +134,8 @@ void cachefiles_shape_request(struct fscache_object *obj,
 	_enter("{%lx,%lx,%x},%llx,%d",
 	       start, end, max_pages, i_size, shape->for_write);
 
-	if (start >= CACHEFILES_SIZE_LIMIT / PAGE_SIZE) {
+	if (start >= CACHEFILES_SIZE_LIMIT / PAGE_SIZE ||
+	    max_pages < CACHEFILES_GRAN_PAGES) {
 		shape->to_be_done = FSCACHE_READ_FROM_SERVER;
 		return;
 	}
@@ -144,10 +145,6 @@ void cachefiles_shape_request(struct fscache_object *obj,
 	if (shape->i_size > CACHEFILES_SIZE_LIMIT)
 		i_size = CACHEFILES_SIZE_LIMIT;
 
-	max_pages = round_down(max_pages, CACHEFILES_GRAN_PAGES);
-	if (end - start > max_pages)
-		end = start + max_pages;
-
 	granule = start / CACHEFILES_GRAN_PAGES;
 	if (granule / 8 >= object->content_map_size) {
 		cachefiles_expand_content_map(object, i_size);
@@ -185,6 +182,10 @@ void cachefiles_shape_request(struct fscache_object *obj,
 		start = round_down(start, CACHEFILES_GRAN_PAGES);
 		end   = round_up(end, CACHEFILES_GRAN_PAGES);
 
+		/* Trim to the maximum size the netfs supports */
+		if (end - start > max_pages)
+			end = round_down(start + max_pages, CACHEFILES_GRAN_PAGES);
+
 		/* But trim to the end of the file and the starting page */
 		eof = (i_size + PAGE_SIZE - 1) >> PAGE_SHIFT;
 		if (eof <= shape->proposed_start)

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


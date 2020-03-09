Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3921517E491
	for <lists+linux-cachefs@lfdr.de>; Mon,  9 Mar 2020 17:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583770749;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=slqeDNvN0rwhdQfvSlDyAKSjSkCoBLgIhUHy28uFAZ4=;
	b=YQR/6i30smESjCwDIh83XhMy0bo6GQFLR+KoTO1cgEOLSO9dtoAcvhpmFAt1vQVASuh74s
	VvlaOwGX6ycohWKJ2hru1Hh/foCZEo6nizNtUyf5MU+LRvj4U1dUGUnYOM3XgsP83wJ+gU
	vBQnsM43CxK9IMyJ4F6HM0taGHzHwGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-Trizyk8zOvuVop9bNMcomA-1; Mon, 09 Mar 2020 12:19:06 -0400
X-MC-Unique: Trizyk8zOvuVop9bNMcomA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F402800D5A;
	Mon,  9 Mar 2020 16:19:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58F131001925;
	Mon,  9 Mar 2020 16:18:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3548418089C8;
	Mon,  9 Mar 2020 16:18:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 029GGovV020217 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 9 Mar 2020 12:16:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F0A81000D9A; Mon,  9 Mar 2020 16:16:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AED010031EF
	for <linux-cachefs@redhat.com>; Mon,  9 Mar 2020 16:16:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B5E18BA537
	for <linux-cachefs@redhat.com>; Mon,  9 Mar 2020 16:16:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-36-Of-RSy1XPAaJ4ES04tT8dg-1;
	Mon, 09 Mar 2020 12:16:46 -0400
X-MC-Unique: Of-RSy1XPAaJ4ES04tT8dg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 17E1BAB92;
	Mon,  9 Mar 2020 16:16:45 +0000 (UTC)
Received: from localhost (webern.olymp [local])
	by webern.olymp (OpenSMTPD) with ESMTPA id 2bb7b078;
	Mon, 9 Mar 2020 16:16:43 +0000 (WET)
Date: Mon, 9 Mar 2020 16:16:43 +0000
From: Luis Henriques <lhenriques@suse.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20200309161643.GA92486@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 029GGovV020217
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 09 Mar 2020 12:18:51 -0400
Cc: linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH] fscache: drop fscache_cookie_put on
 duplicated cookies in the hash
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

When there's a collision due to a duplicate cookie, __fscache_register_netfs
will do an fscache_cookie_put.  This, however, isn't required as
fscache_cookie_get hasn't been executed, and will lead to a NULL pointer as
fscache_unhash_cookie will be called.

Signed-off-by: Luis Henriques <lhenriques@suse.com>
---
 fs/fscache/netfs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/fscache/netfs.c b/fs/fscache/netfs.c
index cce92216fa28..07a55371f0a4 100644
--- a/fs/fscache/netfs.c
+++ b/fs/fscache/netfs.c
@@ -52,7 +52,6 @@ int __fscache_register_netfs(struct fscache_netfs *netfs)
 	return 0;
 
 already_registered:
-	fscache_cookie_put(candidate, fscache_cookie_put_dup_netfs);
 	_leave(" = -EEXIST");
 	return -EEXIST;
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FDA44B4DE
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Nov 2021 22:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636493996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=67uBqcZ+/ootnDjsfXEp4JgF5V/GiKd5y2PYfnoQSDA=;
	b=fHKHOndRu7cbvwghAzA4DTeqinnKdiHj/c6ZUWjjBICtpzoAoouGdTWRXFNAfCQ7jYkEJ1
	fcdhem5JQO3IRq4EiWZWZ6QiZ6d3KlM7anhtG9N4unmCvfLJWh7gwsfh1GLSXzmqPHUnTs
	OtqoWAB7fZ0l1zDo6AlFF/hLoOzpG+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-dYXdybzGPGei4RCOtDjtHQ-1; Tue, 09 Nov 2021 16:39:51 -0500
X-MC-Unique: dYXdybzGPGei4RCOtDjtHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A100C18D6A25;
	Tue,  9 Nov 2021 21:39:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7346D60843;
	Tue,  9 Nov 2021 21:39:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6D171800FE4;
	Tue,  9 Nov 2021 21:39:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A9LRTre006815 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 9 Nov 2021 16:27:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E99CE19E7E; Tue,  9 Nov 2021 21:27:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AA7D60657;
	Tue,  9 Nov 2021 21:27:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Tue, 09 Nov 2021 21:27:23 +0000
Message-ID: <163649324326.309189.17817587229450840783.stgit@warthog.procyon.org.uk>
In-Reply-To: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
References: <163649323416.309189.4637503793406396694.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	kafs-testing@auristor.com, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: [Linux-cachefs] [PATCH v4 1/5] folio: Add a function to change the
 private data attached to a folio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a function, folio_change_private(), that will change the private data
attached to a folio, without the need to twiddle the private bit or the
refcount.  It assumes that folio_add_private() has already been called on
the page.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Tested-by: Jeff Layton <jlayton@kernel.org>
Tested-by: Dominique Martinet <asmadeus@codewreck.org>
Tested-by: kafs-testing@auristor.com
Link: https://lore.kernel.org/r/162981149911.1901565.17776700811659843340.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/163005743485.2472992.5100702469503007023.stgit@warthog.procyon.org.uk/ # v2
Link: https://lore.kernel.org/r/163584180781.4023316.5037526301198034310.stgit@warthog.procyon.org.uk/ # v3
---

 include/linux/pagemap.h |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 6a30916b76e5..1f560aecd9b5 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -279,6 +279,25 @@ static inline void folio_attach_private(struct folio *folio, void *data)
 	folio_set_private(folio);
 }
 
+/**
+ * folio_change_private - Change private data on a folio.
+ * @folio: Folio to change the data on.
+ * @data: Data to set on the folio.
+ *
+ * Change the private data attached to a folio and return the old
+ * data.  The page must previously have had data attached and the data
+ * must be detached before the folio will be freed.
+ *
+ * Return: Data that was previously attached to the folio.
+ */
+static inline void *folio_change_private(struct folio *folio, void *data)
+{
+	void *old = folio_get_private(folio);
+
+	folio->private = data;
+	return old;
+}
+
 /**
  * folio_detach_private - Detach private data from a folio.
  * @folio: Folio to detach data from.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


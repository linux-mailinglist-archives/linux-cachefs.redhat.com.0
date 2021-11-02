Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4259F44298C
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Nov 2021 09:32:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635841941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zn4Xvu5iEWYAMeWa3Lyv+xdzAVm642372D3apg2bvXg=;
	b=CUUdlSPQjZHAVJKlO+FqWNOFXqwBMwJpBY1XrhdZzyzbOsPF16k2cyZ6ZJIn8rD0a52Pm/
	MA/cWEeoO2H2XPQbfWL0D2SmBExR019rDqYr5O4qTyjwoqiffmwm2bBKuY6VWwsOhnNfrj
	4RoNoEDoskbVgRaxNGFOcB9Cs5wGwQc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-ugACRtdvPlOKFvQKW_jaxA-1; Tue, 02 Nov 2021 04:32:17 -0400
X-MC-Unique: ugACRtdvPlOKFvQKW_jaxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70E33802B61;
	Tue,  2 Nov 2021 08:32:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CB5919C59;
	Tue,  2 Nov 2021 08:32:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B1AE1809C81;
	Tue,  2 Nov 2021 08:32:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A28UfmD014905 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 04:30:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F85760CC9; Tue,  2 Nov 2021 08:30:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 913AD60C17;
	Tue,  2 Nov 2021 08:30:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Date: Tue, 02 Nov 2021 08:30:07 +0000
Message-ID: <163584180781.4023316.5037526301198034310.stgit@warthog.procyon.org.uk>
In-Reply-To: <163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>
References: <163584174921.4023316.8927114426959755223.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
	devel@lists.orangefs.org
Subject: [Linux-cachefs] [PATCH v3 3/6] folio: Add a function to change the
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Link: https://lore.kernel.org/r/162981149911.1901565.17776700811659843340.stgit@warthog.procyon.org.uk/
Link: https://lore.kernel.org/r/163005743485.2472992.5100702469503007023.stgit@warthog.procyon.org.uk/ # v2
---

 include/linux/pagemap.h |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 013cdc90f5fd..569302e4defe 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -229,6 +229,25 @@ static inline void folio_attach_private(struct folio *folio, void *data)
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


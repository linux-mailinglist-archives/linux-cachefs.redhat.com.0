Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B37BE4C8838
	for <lists+linux-cachefs@lfdr.de>; Tue,  1 Mar 2022 10:39:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646127568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7uRfY8xTPn95K71IwHGZVn+/a6jhIvsbzrXcj6EbgAk=;
	b=NT2OMwomFpu9VVVhIZmA0kEb7cSqUhgmPvw3FXYOxAdMOf9JFC36zv9828L5cZjYIiygE+
	PDLVUsY+qg07mc+cOQ/uHCvzD3tFY11K8FrJv/aw4eD8A21F6yLvJaHvgI7B1JQXpTKlDE
	8rFueyN2rnP86WQt4p/LD6qBQxsKB+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-eWYw5fPMPvCPviogCwnrTg-1; Tue, 01 Mar 2022 04:39:25 -0500
X-MC-Unique: eWYw5fPMPvCPviogCwnrTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B33B71091DA0;
	Tue,  1 Mar 2022 09:39:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 971A06F80D;
	Tue,  1 Mar 2022 09:39:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 423121809C98;
	Tue,  1 Mar 2022 09:39:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 2219dHdD001946 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 1 Mar 2022 04:39:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3F03783193; Tue,  1 Mar 2022 09:39:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.0])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 783E083199;
	Tue,  1 Mar 2022 09:39:12 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CACdtm0aZnQLyduKxr9dhcpYB_r00UFnR=WQvAnqL0DebxgbrOw@mail.gmail.com>
References: <CACdtm0aZnQLyduKxr9dhcpYB_r00UFnR=WQvAnqL0DebxgbrOw@mail.gmail.com>
	<164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
	<164311919732.2806745.2743328800847071763.stgit@warthog.procyon.org.uk>
	<CACdtm0YtxAUMet_PSxpg69OR9_TQbMQOzU5Kbm_5YDe_C7Nb-w@mail.gmail.com>
	<3013921.1644856403@warthog.procyon.org.uk>
	<CACdtm0Z4zXpbPBLJx-=AgBRd63hp_n+U-5qc0gQDQW0c2PY7gg@mail.gmail.com>
	<2498968.1646058507@warthog.procyon.org.uk>
To: Rohith Surabattula <rohiths.msft@gmail.com>
MIME-Version: 1.0
Date: Tue, 01 Mar 2022 09:39:11 +0000
Message-ID: <2568725.1646127551@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, jlayton@kernel.org,
	smfrench@gmail.com, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC PATCH 7/7] cifs: Use netfslib to handle
	reads
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2568724.1646127551.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Btw, do you have any changes on top of my cifs-experimental branch?

Also, what commands are you running to test it?  I see you're using 'vi' - is
it possible that vi is opening the file O_RDWR?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


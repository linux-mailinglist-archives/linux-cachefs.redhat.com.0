Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DBF619BC3
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Nov 2022 16:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667576074;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zqnBlW8bhFAd2m4QKMYSEwu3okca1AFOZ+IMuFWJzqg=;
	b=LJFxfB7himrcwoEMoyP2Nb68xRNKWEhCqoWdp2k6O6gBrJ1cL4qGXgsKeJFMW2FaRLnZK3
	I2icgTlw+K9q8AT9YSTVXIUYltu8oaHGic7zXMg/Dz6oBFe+LT153W04S8bBO6pB4c3w2U
	SuIzAzfekymPcy3LdkztWYWAS9uKE4E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-dle39uJxMrOALOa45MH_Lg-1; Fri, 04 Nov 2022 11:34:30 -0400
X-MC-Unique: dle39uJxMrOALOa45MH_Lg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97B62833A0E;
	Fri,  4 Nov 2022 15:34:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDAB12166B26;
	Fri,  4 Nov 2022 15:34:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A71B11946594;
	Fri,  4 Nov 2022 15:34:28 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 986DC1946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 15:34:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6105B2166B4B; Fri,  4 Nov 2022 15:34:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C84B2166B26;
 Fri,  4 Nov 2022 15:34:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Y2SJw7w1IsIik3nb@casper.infradead.org>
References: <Y2SJw7w1IsIik3nb@casper.infradead.org>
 <166751120808.117671.15797010154703575921.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Fri, 04 Nov 2022 15:34:25 +0000
Message-ID: <931865.1667576065@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Linux-cachefs] [PATCH] netfs: Fix missing xas_retry() calls in
 xarray iteration
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
Cc: George Law <glaw@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <931864.1667576065.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> "unsigned int" assumes that the number of bytes isn't going to exceed 32
> bits.  I tend to err on the side of safety here and use size_t.

Not unreasonable.

> > +		pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
> > +		pgend = pgpos + folio_size(folio);
> 
> What happens if start_page is somewhere inside folio?  Seems to me
> that pgend ends up overhanging into the next folio?

Yeah, I think my maths is dodgy.  I should probably use folio_pos() and/or
offset_in_folio().

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C83451CCDF7
	for <lists+linux-cachefs@lfdr.de>; Sun, 10 May 2020 22:36:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589142972;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=icUkEPdVBooYTzx8Yh2wu0EroEi5XTFuBrxyD+5eW2Q=;
	b=ag+UN/TYbQRUSqNj9BVQLbcn+Y3bHAdHHKDKuCZugK+OIRfcroZvqc8egj4UgAIPh26rz1
	OLLV3aIn8lGhwTec1V9BoSXewvWJDaWfxuRczkoQiTUstpRWZVMvA0cRe+kjO9gXHye/OS
	a5QUzl9ql/CQFy8ICBq1haj697Nm6HY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-ap71Ff0TO4WEdLN7xUHpCw-1; Sun, 10 May 2020 16:36:10 -0400
X-MC-Unique: ap71Ff0TO4WEdLN7xUHpCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6481F107ACCA;
	Sun, 10 May 2020 20:36:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D1E21001925;
	Sun, 10 May 2020 20:36:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E6E14CAA0;
	Sun, 10 May 2020 20:35:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04AKZpGO014457 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 10 May 2020 16:35:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 676C570915; Sun, 10 May 2020 20:35:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
	[10.10.118.225])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C83C160DB4;
	Sun, 10 May 2020 20:35:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <d4efead1d6dba67f5c862a8d00ca88dd3c45dd34.camel@hammerspace.com>
References: <d4efead1d6dba67f5c862a8d00ca88dd3c45dd34.camel@hammerspace.com>
	<158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
To: Trond Myklebust <trondmy@hammerspace.com>
MIME-Version: 1.0
Content-ID: <1787829.1589142943.1@warthog.procyon.org.uk>
Date: Sun, 10 May 2020 21:35:43 +0100
Message-ID: <1787830.1589142943@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"carmark.dlut@gmail.com" <carmark.dlut@gmail.com>,
	"cmaiolino@redhat.com" <cmaiolino@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-cachefs@redhat.com" <linux-cachefs@redhat.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
	"anna.schumaker@netapp.com" <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 0/5] cachefiles, nfs: Fixes
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

Trond Myklebust <trondmy@hammerspace.com> wrote:

> I can pull this branch, and send it together with the NFS client
> bugfixes for 5.7-rc5.

Thanks!

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs


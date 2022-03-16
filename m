Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 964EF4DAD30
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Mar 2022 10:06:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647421595;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VapyX2OMFXz7+7FGWofC2YlnYyZOntxruNAHzn68fB4=;
	b=Qar8tCDgOK+bC6kcXnzYw3ctSg2k14SZkUG4DkEzUDeHFMvlp7gwJ4t9CDbCY9R8jAwLbZ
	rtP1qy1V5J/NDk9Sn2NoCo5fda8vZ34AxHNwMd+gc8+KwREuxFdLVTtRfFphcElvTptwC1
	DA12huMZm+yd3symDnciNLsoSrKT+R8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-jtq4i5jaP1Gn-TBWGkV7Ng-1; Wed, 16 Mar 2022 05:06:34 -0400
X-MC-Unique: jtq4i5jaP1Gn-TBWGkV7Ng-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B9F03C00086;
	Wed, 16 Mar 2022 09:06:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D662409B419;
	Wed, 16 Mar 2022 09:06:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DE4D11940342;
	Wed, 16 Mar 2022 09:06:29 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3C98A19451ED for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 16 Mar 2022 09:06:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF7E4C28112; Wed, 16 Mar 2022 09:06:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA000C28100;
 Wed, 16 Mar 2022 09:06:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <164692909854.2099075.9535537286264248057.stgit@warthog.procyon.org.uk>
References: <164692909854.2099075.9535537286264248057.stgit@warthog.procyon.org.uk>
 <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
To: linux-cachefs@redhat.com
MIME-Version: 1.0
Date: Wed, 16 Mar 2022 09:06:25 +0000
Message-ID: <3536452.1647421585@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v3 13/20] netfs: Add a netfs inode
 context
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
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
 Dominique Martinet <asmadeus@codewreck.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3536451.1647421585.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I found a couple of issues here:

Firstly, netfs_is_cache_enabled() causes the generic/522 xfstest to take 60s
longer.  This can be fixed by:

-       return fscache_cookie_valid(cookie) && fscache_cookie_enabled(cookie);
+       return fscache_cookie_valid(cookie) && cookie->cache_priv &&
+               fscache_cookie_enabled(cookie);

There's no point trying to do caching if there's no cache actually attached.
I wonder if I should actually make this change in fscache_cookie_enabled()
rather than here.


Secondly, the above causes netfs_skip_folio_read() to be skipped a lot more
often than it should, and this hides an incorrect change there.  I made
netfs_skip_folio_read() copy the folio size into a variable to avoid issuing
the calculation multiple times, but I then gave the wrong length when clearing
the tail of the page.  This can be fixed by:

-       zero_user_segments(&folio->page, 0, offset, offset + len, len);
+       zero_user_segments(&folio->page, 0, offset, offset + len, plen);

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


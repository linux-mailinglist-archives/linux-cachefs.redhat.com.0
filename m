Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F5B564BBA
	for <lists+linux-cachefs@lfdr.de>; Mon,  4 Jul 2022 04:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656901962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3aY45zEj1OvwcSKb6FbFuJ4hpz9ssWpbePaXjF22ZHs=;
	b=Ur50HtbX0DPlAqlykleiP7FOermRalzJtBCTBjjpndMfYIAWZEbHhUKG8Twrgz0r3JvI10
	aM+5hiH2SAYvDx2BUrJxsj9SLwmFGk4RcJot6JQAQpH9YeDaDEEqgn5BnzlBhCV5WUPkzC
	d7vb3sMV49731xyQfjr8DmrJpuKE/oY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-czI0HEVLPtS7--FKUZUX6w-1; Sun, 03 Jul 2022 22:32:39 -0400
X-MC-Unique: czI0HEVLPtS7--FKUZUX6w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 615AC83395E;
	Mon,  4 Jul 2022 02:32:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C29A940B40C6;
	Mon,  4 Jul 2022 02:32:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 664A3194704D;
	Mon,  4 Jul 2022 02:32:36 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 29D4F1947041 for <linux-cachefs@listman.corp.redhat.com>;
 Mon,  4 Jul 2022 02:32:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EBE5040336E; Mon,  4 Jul 2022 02:32:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E80FB456CD9
 for <linux-cachefs@redhat.com>; Mon,  4 Jul 2022 02:32:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1A2B801231
 for <linux-cachefs@redhat.com>; Mon,  4 Jul 2022 02:32:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-5Bux2EUXMEmDf8erL4wz5A-1; Sun, 03 Jul 2022 22:32:30 -0400
X-MC-Unique: 5Bux2EUXMEmDf8erL4wz5A-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o8BXV-00GsK3-Pr; Mon, 04 Jul 2022 02:10:17 +0000
Date: Mon, 4 Jul 2022 03:10:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Xiubo Li <xiubli@redhat.com>
Message-ID: <YsJMCZB/ecQQha+/@casper.infradead.org>
References: <20220701022947.10716-1-xiubli@redhat.com>
 <20220701022947.10716-2-xiubli@redhat.com>
 <30a4bd0e19626f5fb30f19f0ae70fba2debb361a.camel@kernel.org>
 <f55d10f8-55f6-f56c-bb41-bce139869c8d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f55d10f8-55f6-f56c-bb41-bce139869c8d@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH 1/2] netfs: release the folio lock and
 put the folio before retrying
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
Cc: keescook@chromium.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org, idryomov@gmail.com,
 vshankar@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 04, 2022 at 09:13:44AM +0800, Xiubo Li wrote:
> On 7/1/22 6:38 PM, Jeff Layton wrote:
> > I don't know here... I think it might be better to just expect that whe=
n
> > this function returns an error that the folio has already been unlocked=
.
> > Doing it this way will mean that you will lock and unlock the folio a
> > second time for no reason.
> >=20
> > Maybe something like this instead?
> >=20
> > diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
> > index 42f892c5712e..8ae7b0f4c909 100644
> > --- a/fs/netfs/buffered_read.c
> > +++ b/fs/netfs/buffered_read.c
> > @@ -353,7 +353,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
> >                          trace_netfs_failure(NULL, NULL, ret, netfs_fai=
l_check_write_begin);
> >                          if (ret =3D=3D -EAGAIN)
> >                                  goto retry;
> > -                       goto error;
> > +                       goto error_unlocked;
> >                  }
> >          }
> > @@ -418,6 +418,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
> >   error:
> >          folio_unlock(folio);
> >          folio_put(folio);
> > +error_unlocked:
> >          _leave(" =3D %d", ret);
> >          return ret;
> >   }
>=20
> Then the "afs" won't work correctly:
>=20
> 377 static int afs_check_write_begin(struct file *file, loff_t pos, unsig=
ned
> len,
> 378=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 struct folio *folio, void **_fsdata)
> 379 {
> 380=A0=A0=A0=A0=A0=A0=A0=A0 struct afs_vnode *vnode =3D AFS_FS_I(file_ino=
de(file));
> 381
> 382=A0=A0=A0=A0=A0=A0=A0=A0 return test_bit(AFS_VNODE_DELETED, &vnode->fl=
ags) ? -ESTALE : 0;
> 383 }
>=20
> The "afs" does nothing with the folio lock.

It's OK to fix AFS too.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs


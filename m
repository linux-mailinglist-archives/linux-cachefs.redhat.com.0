Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD864F7EC0
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 14:10:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-qjJb8gK8OiyJWjzXYFyiUg-1; Thu, 07 Apr 2022 08:10:48 -0400
X-MC-Unique: qjJb8gK8OiyJWjzXYFyiUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53FE7811E78;
	Thu,  7 Apr 2022 12:10:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4862440CFD09;
	Thu,  7 Apr 2022 12:10:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DC0881947BBE;
	Thu,  7 Apr 2022 12:10:45 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0D6581947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 12:10:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E259D2024CBC; Thu,  7 Apr 2022 12:10:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DBA6E200C0F2
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:10:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E57C80005D
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:10:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-AhEqvO7KOGmS-BMVkQA9sg-1; Thu, 07 Apr 2022 08:10:36 -0400
X-MC-Unique: AhEqvO7KOGmS-BMVkQA9sg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A4A0FCE2768;
 Thu,  7 Apr 2022 12:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9311FC385A7;
 Thu,  7 Apr 2022 12:02:28 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org,
	dhowells@redhat.com
Date: Thu,  7 Apr 2022 08:02:22 -0400
Message-Id: <20220407120224.76156-4-jlayton@kernel.org>
In-Reply-To: <20220407120224.76156-1-jlayton@kernel.org>
References: <20220407120224.76156-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [RFC PATCH 3/5] ceph: Use the provided iterator in
 ceph_netfs_issue_op()
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
Cc: linux-cachefs@redhat.com, idryomov@gmail.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============8138254885595917396=="

--===============8138254885595917396==
Content-Transfer-Encoding: quoted-printable
Content-Type: application/octet-stream; x-default=true

From: David Howells <dhowells@redhat.com>

The netfs_read_subrequest struct now contains a persistent iterator
representing the destination buffer for a read that the network filesystem
should use.  Make ceph use this.

Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index f0af362f8756..e7a7b5d29c7d 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -233,7 +233,6 @@ static bool ceph_netfs_issue_op_inline(struct netfs_io_=
subrequest *subreq)
 =09struct ceph_mds_request *req;
 =09struct ceph_mds_client *mdsc =3D ceph_sb_to_mdsc(inode->i_sb);
 =09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09struct iov_iter iter;
 =09ssize_t err =3D 0;
 =09size_t len;
=20
@@ -266,8 +265,7 @@ static bool ceph_netfs_issue_op_inline(struct netfs_io_=
subrequest *subreq)
 =09}
=20
 =09len =3D min_t(size_t, iinfo->inline_len - subreq->start, subreq->len);
-=09iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages, subreq->start, le=
n);
-=09err =3D copy_to_iter(iinfo->inline_data + subreq->start, len, &iter);
+=09err =3D copy_to_iter(iinfo->inline_data + subreq->start, len, &subreq->=
iter);
 =09if (err =3D=3D 0)
 =09=09err =3D -EFAULT;
=20
@@ -285,7 +283,6 @@ static void ceph_netfs_issue_read(struct netfs_io_subre=
quest *subreq)
 =09struct ceph_fs_client *fsc =3D ceph_inode_to_client(inode);
 =09struct ceph_osd_request *req;
 =09struct ceph_vino vino =3D ceph_vino(inode);
-=09struct iov_iter iter;
 =09struct page **pages;
 =09size_t page_off;
 =09int err =3D 0;
@@ -306,15 +303,14 @@ static void ceph_netfs_issue_read(struct netfs_io_sub=
request *subreq)
 =09}
=20
 =09dout("%s: pos=3D%llu orig_len=3D%zu len=3D%llu\n", __func__, subreq->st=
art, subreq->len, len);
-=09iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages, subreq->start, le=
n);
-=09err =3D iov_iter_get_pages_alloc(&iter, &pages, len, &page_off);
+
+=09err =3D iov_iter_get_pages_alloc(&subreq->iter, &pages, len, &page_off)=
;
 =09if (err < 0) {
 =09=09dout("%s: iov_ter_get_pages_alloc returned %d\n", __func__, err);
 =09=09goto out;
 =09}
=20
-=09/* should always give us a page-aligned read */
-=09WARN_ON_ONCE(page_off);
+=09/* FIXME: adjust the len in req downward if necessary */
 =09len =3D err;
=20
 =09osd_req_op_extent_osd_data_pages(req, 0, pages, len, 0, false, false);
--=20
2.35.1


--===============8138254885595917396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

--===============8138254885595917396==--


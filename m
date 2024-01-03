Return-Path: <linux-cachefs+bncBDLIXLMFVAERBYPM2WWAMGQEYZGK5AY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D7D822FF6
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 15:59:46 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-680c8d21542sf8343586d6.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 06:59:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704293985; cv=pass;
        d=google.com; s=arc-20160816;
        b=vDWPWHtYSd2km7HXL+PFWS+koiyW2yZ4g09TcYhcAaohDj9ibbK+E+Y6ud5BzBixfr
         bU0qhZWxuR97lNiDyJnWZZ1Yg+kYZ0sRNCSy0oX/HStfPA9HoUOZt83w3jVT1REf7eqU
         +p/HC08JeM9Gb+TJIlOtiFD9AWanQJGLLnw49Zb3MmLqb19hc7/AAZ84ALNz2kq4JwVz
         HbsORdYuk/QWNJr9LeksJT67r6Xfo0ELWCvPm0GawTKaThj51M2wL7OxU99j1VMEZqx2
         /0sNLBehtvAFebBwdmH45sqBdBOyb94aEuCXWsa2ejsmJj0sZNoGA3Om+6LnZlFvTSIe
         63YQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=7bEP4FAi3N8bRryX/xOzIrz7QlIB5XLNxOUhWPlxkw0=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=G2rFw00RFO+PJu0yI2x8a2fboGxPkE2CMN4gAfSHpL6lErKvrmojdFSAH9Z8a4Zlmm
         AKeZZ9absYXTgxQT5ff7RrZtR+zRROLfZwVxuUEw675yS58b4FcYUx7lavNpNaFqdca5
         jPOuagSeSG5gzx2/7zIEZg3P8rE+ndDALxuJJGFEL109+P2kYe8xv+bILEiYy12YmHNZ
         oDgC1IwqEJ+lSU3XZWJrZJSid13N1FLUOpBtI33RG82I8uwOc+uqDMG1vVSnFgI+F+Ll
         xVcH94fEySoQnF9BMbc218dLQ6bsnjiN2WpadxfQQ9AEAVfW/nULhtpPVcRhnKV92JPD
         TDpQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704293985; x=1704898785;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7bEP4FAi3N8bRryX/xOzIrz7QlIB5XLNxOUhWPlxkw0=;
        b=f4nFhkYpoRWi0lhK2xHi3fMw09Vn35uBjsliGY7Uek36O6tuHb3/41lOO7RUb1ryfF
         M252fX22HH3br/5DlNqmF+moTz8dae+pQxXtM4zxNF7s7fq4vAfLFcCcKoF+2D/302V/
         1vce/DPwJBL9IRVlvH4CLyAUsatPDXV9+3Q9CQSy1tkkbNq+Qg8pbXOejqpxjqRc+QUS
         Uf+UyGm1fjMH2w8MKVFFNRYc/jqrfq7RUKyFc/pYJWG7XQxnHjZRGYFq6Xkw85m/p77i
         7/yns9J4Cl/HNthqJIJkga9wmDLwJqBFH0j9yniksbmLfGevgsYA91UwHWT1BwgeYpX9
         IT5A==
X-Gm-Message-State: AOJu0YyQneT2JltTmfkgO1FSYqrJb118FKNFjJtLvZRFHjhseWVmfbCn
	lUlKBntBgZPdgq47N8mnIOvgCVT6nuhRKw==
X-Google-Smtp-Source: AGHT+IGRldt1M04er9RqhYkG5PyDOAkVmmQR0y3k7EyRzLuu6LwLXkoXm80UwejDf/sdEjm9OPgUCg==
X-Received: by 2002:a0c:e885:0:b0:67f:9c35:ada3 with SMTP id b5-20020a0ce885000000b0067f9c35ada3mr1347373qvo.59.1704293985659;
        Wed, 03 Jan 2024 06:59:45 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:809:b0:680:c809:c0bf with SMTP id
 df9-20020a056214080900b00680c809c0bfls633314qvb.0.-pod-prod-00-us; Wed, 03
 Jan 2024 06:59:44 -0800 (PST)
X-Received: by 2002:a05:6214:5144:b0:680:cd6d:2d99 with SMTP id kh4-20020a056214514400b00680cd6d2d99mr1068546qvb.40.1704293984427;
        Wed, 03 Jan 2024 06:59:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704293984; cv=none;
        d=google.com; s=arc-20160816;
        b=fxSR0ffdVE0o4ZKZGZ+8PCqfOPXr+2hQSi46ez6Fgel0Anjuc3QZjwER/s5H1jIZrR
         sa7ilY3zaAFldTBwIUPKS1yadLMQMSG840U4cpwziRnAhhU6PraGbqBb6XsFipmilOc+
         Pog4n9JjKO2RyMM/vabBNPi2ribu3q843lkuZv8IU6of7+0EByT83X3/Fc/0+9l8Yn9p
         RMbJTUbEYE0qJHrL9EB4ewy2id7mZ1/3UJBlX44tEXbljzDJqQAIZZzjRHcGxNGL11jP
         TOV8bH7fw6TR5uEQxZRkKxvfNCCSIZFxxH98UJixl+8syLaClv8duIimXyodmaFjO1mt
         xpPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=s3o3MrTd6nm5lawOB5Ax6jA2uuGzy36Eef5IBUe+5HY=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=m4Zdw71j6FhtN1inUL0x5ffbO5crVmf5JcOxuSYrsMpYJrr2HOyRw3SG3fx2cKJGHu
         cI+cz+INq2+jXEbuTVarEbCG7CFtiUuz7vyIsR03xryM2xEsIYxUgHCKqo2iutOomb+g
         2nKEc3VicBb0FJ0RpMWPT0YfkpvY2JsaEiGJOSwQHXhhyEJOyK9tsPEgU9xbCXw5s+O8
         GrIkkoAOJWNbK1SIk6YvwM81uTNQ36XagHe768Vmzo4uanHkXWJdt5q9uxfmRZ0IBx57
         xec2vP3SCKIDlUsz33VtevdROfhYvUUO7cOxAdCbJ6EKWOj654P687Ufu4s7fAazfyCx
         KDdg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id a24-20020a0cb358000000b0067f96a1ad15si23599943qvf.498.2024.01.03.06.59.44
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:59:44 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-ec-fJ29nNzmnmju75TpAYw-1; Wed, 03 Jan 2024 09:59:42 -0500
X-MC-Unique: ec-fJ29nNzmnmju75TpAYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 582FC185A782
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 14:59:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5132AC15968; Wed,  3 Jan 2024 14:59:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24175C15A0C;
	Wed,  3 Jan 2024 14:59:37 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] netfs, cachefiles, 9p: Additional patches
Date: Wed,  3 Jan 2024 14:59:24 +0000
Message-ID: <20240103145935.384404-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Hi Christian, Jeff, Gao, Dominique,

Here are some additional patches for my netfs-lib tree:

 (1) Fix __cachefiles_prepare_write() to correctly validate against the DIO
     alignment.

 (2) 9p: Fix initialisation of the netfs_inode so that i_size is set before
     netfs_inode_init() is called.

 (3) 9p: Do a couple of cleanups (remove a couple of unused vars and turn a
     BUG_ON() into a warning).

 (4) 9p: Always update remote_i_size, even if we're asked not to update
     i_size in stat2inode.

 (5) 9p: Return the amount written in preference to an error if we wrote
     something.

David

The netfslib postings:
Link: https://lore.kernel.org/r/20231013160423.2218093-1-dhowells@redhat.com/ # v1
Link: https://lore.kernel.org/r/20231117211544.1740466-1-dhowells@redhat.com/ # v2
Link: https://lore.kernel.org/r/20231207212206.1379128-1-dhowells@redhat.com/ # v3
Link: https://lore.kernel.org/r/20231213152350.431591-1-dhowells@redhat.com/ # v4
Link: https://lore.kernel.org/r/20231221132400.1601991-1-dhowells@redhat.com/ # v5

David Howells (5):
  cachefiles: Fix __cachefiles_prepare_write()
  9p: Fix initialisation of netfs_inode for 9p
  9p: Do a couple of cleanups
  9p: Always update remote_i_size in stat2inode
  9p: Use length of data written to the server in preference to error

 fs/9p/v9fs_vfs.h       |  1 +
 fs/9p/vfs_addr.c       | 24 ++++++++++++------------
 fs/9p/vfs_inode.c      |  6 +++---
 fs/9p/vfs_inode_dotl.c |  7 ++++---
 fs/cachefiles/io.c     | 28 +++++++++++++++++-----------
 5 files changed, 37 insertions(+), 29 deletions(-)

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


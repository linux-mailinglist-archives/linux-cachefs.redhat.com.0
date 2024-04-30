Return-Path: <linux-cachefs+bncBDLIXLMFVAERBWPTYOYQMGQE2VP4SCI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mail.lfdr.de (Postfix) with ESMTPS id E14848B77E1
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:02:02 +0200 (CEST)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-dcdc3db67f0sf9019516276.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:02:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485722; cv=pass;
        d=google.com; s=arc-20160816;
        b=eTEYUuewP41BsvH4DVeLgs/zfbKwUDCcnV2RCpLDCFBiimD0AdtFyEGRy/6wn3oPNS
         n5g8cvQdEAdzZ/RiM5UTSeJPiCrCIHDcTREo05RgINw8/DF1Wd72Ss1X2QMGdchJhfUS
         5jwk616xljd7W6ofw7/ylXLKv2/99CC+foLooWEGSKeGgpQ4MHJqNN7i3Sq8ULLN/pfp
         YWlwxA1zhTJT++R6l757vqivBomSnBDZH/BqFXpck6jCuJ1PF2r6p2eoXd+7ybTatvOd
         x/6+Ldb4h8gzVINN58wqqmI4JXi/sA0yKxeDAT0r1ZgxfZt9UgzF8L6PNHxFD8IcXP2M
         syyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9ihGqxajD3axUQ4ZG14t06i8Ok3RA4NzAXOshUF107U=;
        fh=Rnb1bT9ABR9zeH2UliR48P3vUXS+AWuNYJTf2eTwoMk=;
        b=d+1SLi1f92E/aBz9nSuajqmpl4zl52j9MgRCuDjDpyK6A290BmallDm+W1zYAEBJd+
         z0VNIeG1m5PvHIPXTGiQG6V6G4Y+NM2WfGAnDIeEr0JjkRs9fTwNY4pAAxcCZuY+B5BC
         Eh7xcwF2N9GNvl8eRZgR+KKbNc08kDcMBeOT2mgGi18HVIoir9eqqJ6e3PGYym50Ano7
         nYRRONA1kS+hwOXpT2EgMikXzkUqebP9LrU4x9mnnWqpZUxMBoEJr2VtO4hWYbLUJAtR
         avJbuOs9S0jW7/5sPoSs4H37RMvqEDb/TYIZ91Sr4vf1WiR6ijlcXRLJccESzCakm4KD
         M2vA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485721; x=1715090521;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ihGqxajD3axUQ4ZG14t06i8Ok3RA4NzAXOshUF107U=;
        b=FyyXixFFyCmd2zE73uqgLO49OsK1mG8KfC/BP50EqXYW1JJ1YKaPxNgV0je+1ZiaZ2
         ISZ+s5/pscpD/s57OB024aixKUB3FKnaZXfatTWfaDwiQJejFkDs0IpGpJeLXANd1DzI
         ytq6RzhrRrpusSpwdSAfm5T9KinnZDTyQp+D/zp1bNWl9c7sN6tXxy33dkhOVaTB9wHV
         gI5wxJF1NBKAOQtbh3EZ1rjdJD6IVMuQMHN2l13EwN8jVGAJCVMJSDvG+oGQmQTbBGCZ
         Sd3Wlam4XTgodvoMaBTw+wtuu6nqMPaizchToXK9bBNYbPp1y5VVq04xrtZ8QgmFt1EA
         /d6g==
X-Forwarded-Encrypted: i=2; AJvYcCU8+Zn2YQnc+SbU6iTzc4IxFxfclYWfECc1V7tFpOmB4PYbOCyfPdsu5sTJK7kC2gfgfrcdG3FWpXvJ/H/4Mgn8fWk+Vzzs+Nr63XQ=
X-Gm-Message-State: AOJu0Yy/uKeycbMWTAIyVJSv3Lo2/CwgWD0m33Mt6758+ofOSzez46ia
	BmVVYNwpgo57z/PmBJhRfc0GNxPe3YraV3huvpk1DpsOHN5VVWvNmF9jfzFZSk0=
X-Google-Smtp-Source: AGHT+IHwaorYWTadsST554FywFvKvC5ricQsANULR6P0jCDfQCXeLiqEZui4KP7UhQ2xurMDRZ0Y+g==
X-Received: by 2002:a05:6902:e93:b0:de5:4eee:2240 with SMTP id dg19-20020a0569020e9300b00de54eee2240mr1816813ybb.13.1714485721247;
        Tue, 30 Apr 2024 07:02:01 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:3627:0:b0:dcc:4b24:c0de with SMTP id 3f1490d57ef6-de5acf99481ls150878276.0.-pod-prod-00-us;
 Tue, 30 Apr 2024 07:02:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/vMEpPFU60o1/S+SGcCj0GQg+a2fbX3pqPTH1C9WHoiOagJ583hUINU+uoYM8N75RqIgLpdqQue25dRR7xAJov03k5sx09BcS0eVDD/s=
X-Received: by 2002:a0d:dc83:0:b0:61a:bf86:9d29 with SMTP id f125-20020a0ddc83000000b0061abf869d29mr1661083ywe.8.1714485720410;
        Tue, 30 Apr 2024 07:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485720; cv=none;
        d=google.com; s=arc-20160816;
        b=tgt1SvFaWFrpk/VG3TeeCQUwWJvS+EQ6Hvvh09Sc8taFqvN3v4635nGasMwo22H7oI
         iVY/gSQd3m7wsKsuN6fmLCT53ULEFB7vMRI08oXirom6+5HOXc/mRYy1aer3N87e5uf9
         3N0b/tBu9gY2K9wODHSot2Q6f2QEbl2wFgo8znfB0JuOxGqyDQq2wrZo1bq5puDQnUCs
         bQzFopXQYZRrMhMEFZzajGHdjfDfnCgDQJ9KwqlQpS7SAEEKYgY2DAG2Nb/v4AWs0v20
         Lt3jTwsr4Wa/s3hbTwQXlhjMbIq/JKbJ6AMQ0psLCjnuC4UKD5PxcKBRZOKe77c0HS43
         muiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=kjFRfxxSIhn/sZySlzA+YPg8ujVk0zbXsyNAbtLG88o=;
        fh=Wm1tdfrfu9MgvOCT7w7TPWe8kwc1eeFUskHngePaTyc=;
        b=h3d00/tNHlwByxPlbm6Yfr8SRDI1b+LR7Ve9TyFrZH/2e4bwOcvFaVYLbbAc8pGkWD
         UJheEb7EoNubUf2I2Lf9lQvMjVUTpU2sbiB4Mp+Sb/lRYLIqreUXTPcUpbie7QzM/ILr
         frw0TNg54dY19JITQpaVoXCbrIL/35i6LLtO7N0D27EKy7T1VG/jWkpLtG92bBouLKI2
         I3a1kXv6fpw88l2mo0bZNAlZWDhiPj41Z1haUn8xbOCKb8Fi3EKUPQLn/qzcwGThfMQ4
         lb5MQvh2L3Q4nvNRWwvOJFfGTTdH01rY6NZbws+B1dgNnUlJ6ket5sEiT8+28Zk0PuBi
         2lzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id k3-20020a81c503000000b0061adff68c8fsi12860600ywi.559.2024.04.30.07.02.00
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:00 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-519-dMExvH5bMKOFEgbv7fQtCw-1; Tue,
 30 Apr 2024 10:01:56 -0400
X-MC-Unique: dMExvH5bMKOFEgbv7fQtCw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA7DE3819C63
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C66F51C0666C; Tue, 30 Apr 2024 14:01:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD5441C0654E;
	Tue, 30 Apr 2024 14:01:48 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
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
	linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 12/22] mm: Export writeback_iter()
Date: Tue, 30 Apr 2024 15:00:43 +0100
Message-ID: <20240430140056.261997-13-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Export writeback_iter() so that it can be used by netfslib as a module.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Matthew Wilcox (Oracle) <willy@infradead.org>
cc: Christoph Hellwig <hch@lst.de>
cc: linux-mm@kvack.org
---

Notes:
    Changes
    =======
    ver #2)
     - Mark the symbol _GPL.

 mm/page-writeback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 3e19b87049db..06fc89d981e8 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2546,6 +2546,7 @@ struct folio *writeback_iter(struct address_space *mapping,
 	folio_batch_release(&wbc->fbatch);
 	return NULL;
 }
+EXPORT_SYMBOL_GPL(writeback_iter);
 
 /**
  * write_cache_pages - walk the list of dirty pages of the given address space and write all of them.

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.


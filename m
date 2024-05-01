Return-Path: <linux-cachefs+bncBDLIXLMFVAERBOWZZCYQMGQEKTW3L7Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B4F8B8970
	for <lists+linux-cachefs@lfdr.de>; Wed,  1 May 2024 13:51:24 +0200 (CEST)
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-de54be7066bsf12035482276.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 01 May 2024 04:51:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714564283; cv=pass;
        d=google.com; s=arc-20160816;
        b=H+f6L2hToBaNLeRK2jeeSjC5Nx2NsF54w0Efv4Cy8MjO6T4YXUNgsG5uzKKNcNQGGf
         g5UJdFBJ514T9K7QttrMuZySaYtbkY6EDE0LqssAQgfERFujRP3H82VUXNgy85QFJY/E
         Eg//0zoBARbRSIg7fnx5uQj5YRpiBKqdSTbWGxdDi63L4CHbV1eHk1b/ZZGdlMZQTeB+
         D2bqEAPTP7J7GDrwQggA/COd0aG3qYIbk0JdjdhRIsvraHV/m7+o5RxLu/AovMXoPH9Q
         pqH6vXRlhvC2Ez0tY0HcOnVA393OXNrfDQOZ5PDw2oKYXIYoANFufRRjsuO4VEU+yAoo
         sLQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=T7gADjwfpuw8y+R3zU9nJvKGTI9c/o7wdUVGa+qE3wo=;
        fh=NEzmZZY3IcNThe2WFD2x8MuRci2Is7aWBd1UCSa0PDo=;
        b=I4st6QPnQZhatB5jjBVHmCHumerh78ff8Asf0HMvB0nRMCU7jtZi0N2Ek7ZMRvtT7q
         0KDukQtkIo3lKL14ZneVmtQe3PXy64mOUd9uLu27Vx4KN1N3VNY9T2aNDg7A6dQdLre8
         Ji8s5ttMUicP0AO1Iqh2JzpXW9qrfzgOWi/SK2zTZNuVDrmK2tFpAexYhFRfsuoBPwV1
         tPqO4B6jbiKZ4Bchn0YceRWIjMImN9SSW8D2P8cDFhicChwiWrVpydMoShh+Bp/XZiaq
         v3KF0s7bLPkt4lSwStyM8X4LapUe0ZxnFj/wZuK7guuibxJDTAw+x57UO0Qgnt8AkFtR
         qUOw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714564283; x=1715169083;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T7gADjwfpuw8y+R3zU9nJvKGTI9c/o7wdUVGa+qE3wo=;
        b=vzolEOQf9axXDspcVll4FJZ17YrNfnRWmjf7xKBMset1qGxse9220pLtQTnqw1tw90
         j/ylRFJ4J02pRWswHX6SPONJ77kKBSszALcooxXzUXDPA+1w//1W+xi7MGUtAO0pPppW
         Jh6d9F1xI1sWUD9ek6iokko8OLxBBTH7krGO4cMkECOL2kC0CfDDjCbUSlbE/0KqKLVR
         hJjU1F+6dztN70qj43FpfXC8bjNXCuyggnj/SsrfXmAOwtScQL0Apu/QkTbOjjjuLrXO
         ABoNpAvumiVA2etXK9MoJMJ0yewkEMo7arV8A94ub6ojfM2rG0xPLikR96wgPSoIJVPN
         Rxpw==
X-Forwarded-Encrypted: i=2; AJvYcCVjX7y5W7nBdhk9fiQ7PQix+fSDvz6vdmn9GljErDeAf/MijFa+A4DoiX4uj0TCAvXt7VSUhEfovnWN6czTpOU3iz49JHCt+PjCAtE=
X-Gm-Message-State: AOJu0YzwXHTiWmd88RLEbWA75VgBrTNgaxtTjbXboQsVw19Rnse8wqKF
	DBj1M3IaPrnyFjqURieMCavoooSEWe2zN2iJRcSMSiTs/1Nq8FWdSlfU+XTBKcA=
X-Google-Smtp-Source: AGHT+IGCX8Ka8y8j3sMKUoLkfK232cMj9xTsKeXCMW0aHSPECKwunVEIBHVQQgENFbJGEQdGufS8yg==
X-Received: by 2002:a25:ef09:0:b0:de5:588e:40c8 with SMTP id g9-20020a25ef09000000b00de5588e40c8mr2509912ybd.56.1714564283150;
        Wed, 01 May 2024 04:51:23 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:948:0:b0:de5:9eb1:327d with SMTP id 3f1490d57ef6-de59eb13f90ls54899276.2.-pod-prod-06-us;
 Wed, 01 May 2024 04:51:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVHFLfQLjMl+1rK5CvL4CC5tIkTHi+uMtMADF+Ka4CNuyUPPZlwuGB6M5zAJjWhSVyhSUga8IdwtDAaG2pPpsXCES8OHKoqTFPxfPzZW1c=
X-Received: by 2002:a25:ad99:0:b0:ddd:696a:8656 with SMTP id z25-20020a25ad99000000b00ddd696a8656mr2376823ybi.41.1714564280366;
        Wed, 01 May 2024 04:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714564280; cv=none;
        d=google.com; s=arc-20160816;
        b=NxFcPjvUil5ouUSnqlbacAPWytNozH1cx4Xr+T8YD3GqDvQBJJkftRdI5WAYANBPO8
         +bWp75RgwDYL/dm08TYlXipMgEvlwde8vgQquESZueI0DUvNoMYSkttNcxUSOWRf/v+8
         nAq/slp0S1D5TAhAdd4CX5R2EOus5EWO9Df2nhJYJxtO2EKgaiFbKiM139u9m1wRXv2P
         XIbHQmwkEVdCF5gAlz8QX0kKnc7RIPNkGWB2FFe99YjTxyAwnvwvyW8FYioYAU5D5McN
         K9jXmoo4r/c1YKejKbi4sQbapRe8Fc8agkxqwUS4Nhr6lwcPx7+LF0oYYgwpe3RebyGO
         4jJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=IedIqAPMp3NLli41xzub1+bwRKfdrBBGDCGk4oKbJwU=;
        fh=QCT0nYxQLXnJJ3ZUAkpm7r7CxvT/Ht1bCmFJUrbrHyQ=;
        b=VRBwvOWI0Lx5Z4yMTJbjiYzrj433XiwPxb91e1yRvxa/CsMUV5D4HLcVgHIe86iegQ
         HcbmsgdCYxrAIFOgGN3zZuFl0ztMSDvaAdYdtrO2qqYT2hBuDwevT2reGZlp8nfFGUND
         ToR817VALS/ruwvZBDcuM9ZqU7eQpYnuvv8tQbmZmVyjCdH0R2Eu2LMcXOFc4merOskh
         aGHo3+I0d3dyijKfGuOAsRwBm/aSBQjInPdgL1NDSA7eDsgINQLYgWFD44haeEZuNK2T
         6VMrCffV8oBfMdcJgVovGGlCHkDEUQLWB84rZvHrhytB/ckkbFZ/spXRqsYiZPhmvB8S
         RDFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id u8-20020ac858c8000000b0043b0b8a1bf4si5582971qta.184.2024.05.01.04.51.20
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 04:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-xnhIWnaqNmSc8JNCbhNnoA-1; Wed,
 01 May 2024 07:51:18 -0400
X-MC-Unique: xnhIWnaqNmSc8JNCbhNnoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E1061C05134
	for <linux-cachefs@gapps.redhat.com>; Wed,  1 May 2024 11:51:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 9B17640C140B; Wed,  1 May 2024 11:51:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E08F740C6CC0;
	Wed,  1 May 2024 11:51:13 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-8-dhowells@redhat.com>
References: <20240430140056.261997-8-dhowells@redhat.com> <20240430140056.261997-1-dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
    Jeff Layton <jlayton@kernel.org>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
    Matthew Wilcox <willy@infradead.org>,
    Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
    Trond Myklebust <trond.myklebust@hammerspace.com>,
    Christoph Hellwig <hch@lst.de>,
    Andrew Morton <akpm@linux-foundation.org>,
    Alexander Viro <viro@zeniv.linux.org.uk>,
    Christian Brauner <brauner@kernel.org>, devel@lists.orangefs.org
Subject: Re: [PATCH v2 07/22] mm: Provide a means of invalidation without using launder_folio
MIME-Version: 1.0
Date: Wed, 01 May 2024 12:51:13 +0100
Message-ID: <438908.1714564273@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <438907.1714564273.1@warthog.procyon.org.uk>
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

David Howells <dhowells@redhat.com> wrote:

> +			.range_start	= first,
> +			.range_end	= last,
> ...
> +	truncate_inode_pages_range(mapping, first, last);

These actually take file offsets and not page ranges and so the attached
change is needed.  Without this, the generic/412 xfstest fails.

David
---
diff --git a/mm/filemap.c b/mm/filemap.c
index 53516305b4b4..3916fc8b10e6 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -4171,15 +4171,15 @@ int filemap_invalidate_inode(struct inode *inode, bool flush,
 		struct writeback_control wbc = {
 			.sync_mode	= WB_SYNC_ALL,
 			.nr_to_write	= LONG_MAX,
-			.range_start	= first,
-			.range_end	= last,
+			.range_start	= start,
+			.range_end	= end,
 		};
 
 		filemap_fdatawrite_wbc(mapping, &wbc);
 	}
 
 	/* Wait for writeback to complete on all folios and discard. */
-	truncate_inode_pages_range(mapping, first, last);
+	truncate_inode_pages_range(mapping, start, end);
 
 unlock:
 	filemap_invalidate_unlock(mapping);

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

